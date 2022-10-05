from __future__ import annotations

import math
from typing import Literal

import numpy as np
from numpy.typing import ArrayLike
from scipy.interpolate import LinearNDInterpolator, NearestNDInterpolator, interpn
from scipy.spatial.transform import Rotation


class GeometryConverter:
    def __init__(
        self,
        clen: float,
        poni: tuple[float],
        pixels: tuple[float],
        pixel_size: tuple[float],
        X1=(0, 0, 1),
        X2=(1, 0, 0),
        X3=(0, 1, 0),
        rot=(0, 0, 0),
        beam_center=None,
        wavelength: float = None,
    ):
        """
        Class for converting coordinates between detector, lab and sample systems.
        Refer to pyFAI's geometry definition for more details.

        :param clen: Distance between the sample and the PONI.
        :param poni: Point Of Normal Incidence coordinates in the detector system in meters ([up, across, 0]).
        :param pixels: Amount of pixels in [up, across] directions.
        :param pixel_size: The size of a single pixel ([height, width]) in meters.
        :param X1: x1 axis (up, lab system) expressed in sample coordinates. Defaults to (0, 0, 1).
        :param X2: x2 axis (paralell to detector, lab system) expressed in sample coordinates. Defaults to (1, 0, 0).
        :param X3: x3 axis (perpendicular to detector, lab system) expressed in sample coordinates. Defaults to (0, 1, 0).
        :param rot: [rot1, rot2, rot3] - see pyFAI geometry (https://pyfai.readthedocs.io/en/master/geometry_conversion.html#geometry-definition-of-pyfai for details.
        :param beam_center: The point where the beam hits the detector, given in meters in the detector system ([up, across]). Optional, required for generating reciprocal space coordinates.
        :param wavelength: The wavelength of the beam in meters. Optional, required for generating reciprocal space coordinates.
        """
        self.generate_basis_vectors(X1, X2, X3, rot)

        assert isinstance(clen, float) or isinstance(
            clen, int
        ), "`clen` must be a number."
        self.clen = clen

        if len(poni) == 3:
            assert poni[2] == 0, "PONI d3-coordinate must be 0."
            self.poni = poni
        else:
            raise ValueError("Invalid PONI.")

        assert len(pixels) == 2, "Can only have pixels in 2 dimensions."
        self.pixels = pixels

        assert len(pixel_size) == 2, "Pixels can only have a size in 2 dimensions."
        self.pixel_size = pixel_size

        assert (
            beam_center is None or len(beam_center) == 2
        ), "Beam center must have 2 dimensions."
        self.beam_center = self.detector_to_lab(np.divide(beam_center, pixel_size))

        self.wavelength = wavelength

    def all_pixels(self) -> ArrayLike[np.int_]:
        """
        Generates a 2d ndarray containing the coordinates of all pixels.
        :return: An ndarray representing all pixels, shape (pixels_across, pixels_up, 2).
        """
        return np.moveaxis(
            np.meshgrid(np.arange(self.pixels[0]), np.arange(self.pixels[1])), 0, -1
        )

    def generate_basis_vectors(self, X1, X2, X3, rot) -> None:
        """
        Generates the vectors needed for conversions between systems.
        :param X1: x1 axis (up, lab system) expressed in sample coordinates. Defaults to (0, 0, 1).
        :param X2: x2 axis (paralell to detector, lab system) expressed in sample coordinates. Defaults to (1, 0, 0).
        :param X3: x3 axis (perpendicular to detector, lab system) expressed in sample coordinates. Defaults to (0, 1, 0).
        :param rot: [rot1, rot2, rot3] - see pyFAI geometry (https://pyfai.readthedocs.io/en/master/geometry_conversion.html#geometry-definition-of-pyfai for details.
        :return: None
        """
        assert len(rot) == 3, "`rot` must have a length of 3."
        # normalize sample basis vectors in lab system
        self.X1_hat = np.array(X1) / np.linalg.norm(X1)  # sample z
        self.X2_hat = np.array(X2) / np.linalg.norm(X2)  # sample x
        self.X3_hat = np.array(X3) / np.linalg.norm(X3)  # sample y

        # detector basis vectors
        d1_hat_lab = np.array([1, 0, 0])
        d2_hat_lab = np.array([0, 1, 0])
        d3_hat_lab = np.array([0, 0, 1])
        detector_rotation = Rotation.from_rotvec(
            [[-rot[0], 0, 0], [0, -rot[1], 0], [0, 0, rot[2]]]
        )
        for rotation in detector_rotation:
            d1_hat_lab = rotation.apply(d1_hat_lab)
            d2_hat_lab = rotation.apply(d2_hat_lab)
            d3_hat_lab = rotation.apply(d3_hat_lab)
        self.d1_hat_lab = d1_hat_lab
        self.d2_hat_lab = d2_hat_lab
        self.d3_hat_lab = d3_hat_lab

    def detector_to_lab(
        self, detector_pixels: ArrayLike[np.int_]
    ) -> ArrayLike[np.float_]:
        """
        Converts an array of detector pixels to lab system coordinates.

        :param detector_pixels: ndarray of detector pixels to convert, shape (-1, 2).
        :return: ndarray of coordinates in lab system, shape (-1, 3).
        """
        pixels = np.reshape(detector_pixels, (-1, 2))

        pixel_size_array = np.array(
            [[self.pixel_size[0], 0], [0, self.pixel_size[1]], [0, 0]]
        )
        offset = np.array([-self.poni[0], -self.poni[1], self.clen])

        converted = []
        for pixel in pixels:
            before_rotation = pixel_size_array @ pixel + offset
            converted.append(
                before_rotation[0] * self.d1_hat_lab
                + before_rotation[1] * self.d2_hat_lab
                + before_rotation[2] * self.d3_hat_lab
            )
        final_shape = list(np.shape(detector_pixels))
        final_shape[-1] = 3

        return np.asarray(converted).reshape(tuple(final_shape))

    def lab_to_sample(self, coordinates: ArrayLike) -> ArrayLike:
        """
        Converts an array of coordinates in the lab system to the sample system.

        :param coordinates: ndarray of coordinates in the lab system, shape (-1, 3) [x1, x2, x3].
        :return: ndarray of coordinates in the sample system, shape (-1, 3) [x, y, z].
        """
        coords = np.reshape(coordinates, (-1, 3))
        return (
            coords.T[0] * self.X1_hat[:, np.newaxis]
            + coords.T[1] * self.X2_hat[:, np.newaxis]
            + coords.T[2] * self.X3_hat[:, np.newaxis]
        ).T.reshape(np.shape(coordinates))

    def detector_to_sample(self, detector_pixels):
        """
        Converts an array or list of detector pixels to their coordinates in the sample system.
        :param detector_pixels: list or ndarray of detector pixels, shape (-1, 2).
        :return: ndarray of coordinates in the sample system, shape (-1, 3).
        """
        return self.lab_to_sample(np.array(self.detector_to_lab(detector_pixels)))

    def lab_to_reciprocal(
        self, coordinates: ArrayLike[np.float_]
    ) -> ArrayLike[np.float_]:
        """
        Converts an array of coordinates from the lab system to reciprocal space.
        Requires `self.beam_center` and `self.wavelength` to be set.
        :param coordinates: ndarray of coordinates to be converted into reciprocal space, shape (-1, 3).
        :return: ndarray of reciprocal space coordinates, shape (-1, 3).
        """
        assert self.beam_center is not None, "`self.beam_center` must be set."
        assert self.wavelength is not None, "`self.wavelength` must be set."

        coords = np.reshape(coordinates, (-1, 3))

        ewald_radius = 1 / self.wavelength
        k0 = self.beam_center / np.linalg.norm(self.beam_center) * ewald_radius

        return self.lab_to_sample(
            coords / np.linalg.norm(coords, axis=1)[:, np.newaxis] * ewald_radius - k0
        ).reshape(np.shape(coordinates))

    def debug_lab_to_reciprocal(
        self, coordinates: ArrayLike[np.float_]
    ) -> ArrayLike[np.float_]:
        """
        Converts an array of coordinates from the lab system to reciprocal space.
        Requires `self.beam_center` and `self.wavelength` to be set.
        :param coordinates: ndarray of coordinates to be converted into reciprocal space, shape (-1, 3).
        :return: ndarray of reciprocal space coordinates, shape (-1, 3).
        """
        assert self.beam_center is not None, "`self.beam_center` must be set."
        assert self.wavelength is not None, "`self.wavelength` must be set."

        coords = np.reshape(coordinates, (-1, 3))

        ewald_radius = 1 / self.wavelength
        k0 = self.beam_center / np.linalg.norm(self.beam_center) * ewald_radius

        return (
            self.lab_to_sample(
                coords / np.linalg.norm(coords, axis=1)[:, np.newaxis] * ewald_radius
                - k0
            ).reshape(np.shape(coordinates)),
            (
                coords / np.linalg.norm(coords, axis=1)[:, np.newaxis] * ewald_radius
                - k0
            ).reshape(np.shape(coordinates)),
        )

    def reciprocal_mesh(
        self, coordinates: ArrayLike[np.float_], resolution=None
    ) -> ArrayLike[np.float_]:
        """
        Generates a reciprocal mesh for the given coordinates and resolution. Produces results similar to `skopi.geometry.get_reciprocal_mesh`.
        :param coordinates: ndarray of reciprocal space coordinates to base the mesh on.
        :param resolution: list or ndarray with 3 values, one for voxel resolution in each direction, shape (3,). Reciprocal space uses the sample system. Will be generated automatically if None.
        :return: mesh as ndarray.
        """
        coordinates = np.reshape(coordinates, (-1, 3))
        ranges = []
        for dim in range(3):
            start = np.amin(coordinates[:, dim])
            stop = np.amax(coordinates[:, dim])
            if resolution is None:
                if dim in [0, 1]:
                    steps = math.ceil(math.sqrt(len(coordinates[:, dim])))
                else:
                    stop / np.amax(coordinates[:, 0:2]) * len(
                        coordinates[:, dim]
                    )  # steps should have similar step sizes in each dimensions, cuts unneeded space from mesh
            else:
                steps = resolution[dim]
            ranges.append(np.linspace(start, stop, steps))
        return np.moveaxis(np.meshgrid(*ranges, indexing="ij"), 0, -1)

    def back_to_detector(
        self,
        coordinates: ArrayLike[np.float_],
        volume: ArrayLike[np.float_],
        interpolator: Literal["nearest", "linear"] = "nearest",
    ):
        """
        Maps the calculated intensity data from skopi back to detector pixels via reciprocal space coordinates.
        :param coordinates: ndarray of reciprocal space coordinates to get values for.
        :param volume: ndarray of intensity values, as calculated by `skopi.gpu.calculate_diffraction_pattern_gpu` or similar.
        :param interpolator: which interpolator to use. nearest is fast but will look bad if your mesh has a lower resolution than your detector, linear is better but very slow.
        :return: ndarray of intensity values for each coord in `coordinates`.
        """
        coords = np.reshape(coordinates, (-1, 3))
        points = self.reciprocal_mesh(coords, volume.shape)
        if interpolator == "nearest":
            interp = NearestNDInterpolator(points.reshape((-1, 3)), volume.flat)
        elif interpolator == "linear":
            interp = LinearNDInterpolator(points.reshape((-1, 3)), volume.flat)
        else:
            raise ValueError("`interpolator` must be either `linear` or `nearest`.")
        return interp(coords).reshape(np.shape(coordinates)[:-1])
