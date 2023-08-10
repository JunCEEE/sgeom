# Copyright (C) 2023 Juncheng E, Mats Fangohr
# Contact: Juncheng E <juncheng.e@xfel.eu>
# This file is part of sgeom which is released under MIT License.

import numpy as np
from numpy import ndarray
from scipy.spatial.transform import Rotation


class sgeom:
    """
    Class to handle the geometry of pixels of a detector

    Args:
        detector_pixels (ndarray): ndarray of pixel positions (vertical, horizontal) in pixel unit, shape (-1, 2). (0, 0) is at the lower left.
        poni (tuple[float]): Point Of Normal Incidence coordinates in the detector system in pixel unit ([vertical, horizontal]) from the lower left.
        clen (float): Distance between the sample and the PONI in meters.
        pixel_size (tuple[float]): The size of a single pixel ([height, width]) in meters.
        X1 (tuple, optional): The X1 axis in lab/beam system toward the ceiling, expressed in sample coordinates. Defaults to sample (0, 0, 1).
        X2 (tuple, optional): The X2 axis in lab/beam system transverse to the incident beam, expressed in sample coordinates. Defaults to sample (1, 0, 0).
        X3 (tuple, optional): The X3 axis in lab/beam system along the incident beam toward the detector in sample coordinates. It defines the beam direction with respect to the sample system. Defaults to sample (0, 1, 0).
        rot (tuple, optional): [rot1, rot2, rot3] in radians - see pyFAI geometry (https://pyfai.readthedocs.io/en/master/geometry_conversion.html#geometry-definition-of-pyfai for details. Defaults to (0, 0, 0).
        wavelength (float): The wavelength of the beam in meters. Defaults to 1.33e-10 (12.398/9.3 KeV).
    """

    def __init__(
        self,
        detector_pixels: ndarray,
        clen: float,
        poni: tuple,
        pixel_size: tuple,
        X1=(0, 0, 1),
        X2=(1, 0, 0),
        X3=(0, 1, 0),
        rot=(0, 0, 0),
        wavelength: float = 1.33e-10,
    ):
        self.__generate_basis_vectors(X1, X2, X3, rot)
        assert isinstance(clen, float) or isinstance(
            clen, int
        ), "`clen` must be a number in meters."
        self.clen = clen

        if not isinstance(pixel_size, (tuple, list, ndarray)):
            pixel_size = (pixel_size, pixel_size)
        assert len(pixel_size) == 2, "Pixels can only have a size in 2 dimensions."
        self.pixel_size = np.array(pixel_size)

        assert len(poni) == 2
        # Convert poni to its physical unit.
        self.poni = np.array(poni) * self.pixel_size

        self.wavelength = wavelength

        assert detector_pixels.shape[-1] == 2
        self.detector_pixels = detector_pixels
        self.det_to_lab()
        self.lab_to_sample()
        self.sample_to_reciprocal()
    
    def info(self):
        strings = "scattering geometry:\n"
        strings += f"number of detector pixels: {self.npixels}"
        print()

    def __generate_basis_vectors(self, X1, X2, X3, rot):
        """
        Generates the vectors needed for conversions between systems.

        Args:
            X1 (tuple): The X1 axis in lab system toward the ceiling, expressed in sample coordinates.
            X2 (tuple): The X2 axis in lab system transverse to the incident beam, expressed in sample coordinates.
            X3 (tuple): The X3 axis in lab system along the incident beam toward the detector in sample coordinates. It defines the beam direction with respect to the sample system.
            rot (tuple): [rot1, rot2, rot3] in radians
        """
        assert len(rot) == 3, "`rot` must have a length of 3."
        """
        The lab axis unit vectors in sample system
        Lab origin and sample origin are the same
        """
        self.X1_hat = np.array(X1) / np.linalg.norm(X1)  # sample z
        self.X2_hat = np.array(X2) / np.linalg.norm(X2)  # sample x
        self.X3_hat = np.array(X3) / np.linalg.norm(X3)  # sample y

        # Detector axis unit vectors are initialized to be overlapped with the lab coordinate.
        d1_hat_lab = np.array([1, 0, 0])
        d2_hat_lab = np.array([0, 1, 0])
        d3_hat_lab = np.array([0, 0, 1])
        # It's not intuitive, but in accord with the pyFAI definition.
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

    @property
    def reciprocal(self):
        """The reciprocal space mesh"""
        return self._reciprocal

    @property
    def qspace(self):
        """The qspace mesh"""
        return self._qspace

    @property
    def npixels(self):
        """Number of pixels"""
        return self.detector_pixels.reshape(-1, 2)

    def det_to_lab(self):
        """Get the pixels in lab system and beam center in detector and beam center"""

        # astype is a copy https://numpy.org/doc/stable/reference/generated/numpy.ndarray.astype.html
        pixels = np.reshape(self.detector_pixels.astype(float), (-1, 2))
        # Convert the unit to meter
        pixels[:, 0] *= self.pixel_size[0]
        pixels[:, 1] *= self.pixel_size[1]
        # Offset the pixels to the sample to detector distance
        clen_array = np.full((pixels.shape[0], 1), self.clen)
        # Get pixels in detector system at sample to detector distance
        pixels = np.concatenate((pixels - self.poni, clen_array), axis=1)
        # PONI vector in detector system
        poni_det_arr = np.array([self.poni[0], self.poni[1], self.clen])
        pixels_lab = np.dot(
            pixels, np.array([self.d1_hat_lab, self.d2_hat_lab, self.d3_hat_lab])
        )
        # poni_lab = np.dot(
        #     poni_det, np.array([self.d1_hat_lab, self.d2_hat_lab, self.d3_hat_lab])
        # )
        poni_lab = poni_det_arr[2] * self.d3_hat_lab
        self.poni_lab = poni_lab
        # Beam direction is defined to be along the X3 axis.
        beam_hat_lab = np.array([0, 0, 1])
        beam_center_lab = get_beam_center_lab(beam_hat_lab, poni_lab)
        beam_center_on_d1 = np.dot(beam_center_lab, self.d1_hat_lab)
        beam_center_on_d2 = np.dot(beam_center_lab, self.d2_hat_lab)
        beam_center_on_d3 = np.dot(beam_center_lab, self.d3_hat_lab)
        beam_center_det_arr = np.array(
            [beam_center_on_d1, beam_center_on_d2, beam_center_on_d3]
        )
        assert beam_center_det_arr[2] - self.clen < 1e-9

        # Set beam_center as the new origin
        # pixels_lab -= beam_center_lab

        final_shape = list(np.shape(self.detector_pixels))
        final_shape[-1] = 3

        self.beam_center_det = (beam_center_det_arr[:2] + self.poni) / self.pixel_size
        self.beam_center_lab = beam_center_lab
        self.pixels_lab = np.reshape(pixels_lab, final_shape)

    def lab_to_sample(self):
        try:
            pixels_lab = np.reshape(self.pixels_lab, (-1, 3))
        except AttributeError:
            self.det_to_lab()
            pixels_lab = np.reshape(self.pixels_lab, (-1, 3))
        pixels_sample = np.dot(
            pixels_lab, np.array([self.X1_hat, self.X2_hat, self.X3_hat])
        )
        beam_center_sample = np.dot(
            self.beam_center_lab, np.array([self.X1_hat, self.X2_hat, self.X3_hat])
        )

        self.beam_center_sample = beam_center_sample
        self.pixels_sample = np.reshape(pixels_sample, self.pixels_lab.shape)

    def sample_to_reciprocal(self):
        coords = np.reshape(self.pixels_sample, (-1, 3))
        ewald_radius = 1 / self.wavelength
        k0 = (
            self.beam_center_sample
            / np.linalg.norm(self.beam_center_sample)
            * ewald_radius
        )
        ks = coords / np.linalg.norm(coords, axis=1)[:, np.newaxis] * ewald_radius
        reciprocal = ks - k0
        qspace = np.linalg.norm(reciprocal, axis=1)
        self._qspace = np.reshape(qspace, self.pixels_sample.shape[:2])
        self._reciprocal = np.reshape(reciprocal, self.pixels_sample.shape)

    @classmethod
    def from_pixel_number(
        cls,
        npixels: tuple[int],
        clen: float,
        poni: tuple[float],
        pixel_size: tuple[float],
        **kwargs
    ):
        """
        Method to create a sgeom instance from number of pixels.

        Args:
            npixels (tuple[int]): Number of pixels in (vertical, horizontal) directions, e.g. (128, 128).
            poni (tuple[float]): Point Of Normal Incidence coordinates in the detector system in pixel unit ([vertical, horizontal]) from the lower left.
            clen (float): Distance between the sample and the PONI in meters.
            pixel_size (tuple[float]): The size of a single pixel ([height, width]) in meters.
            X1 (tuple, optional): The X1 axis in lab/beam system toward the ceiling, expressed in sample coordinates. Defaults to (0, 0, 1).
            X2 (tuple, optional): The X2 axis in lab/beam system transverse to the incident beam, expressed in sample coordinates. Defaults to (1, 0, 0).
            X3 (tuple, optional): The X3 axis in lab/beam system along the incident beam toward the detector in sample coordinates. It defines the beam direction with respect to the sample system. Defaults to (0, 1, 0).
            rot (tuple, optional): [rot1, rot2, rot3] in radians - see pyFAI geometry (https://pyfai.readthedocs.io/en/master/geometry_conversion.html#geometry-definition-of-pyfai for details. Defaults to (0, 0, 0).
            wavelength (float): The wavelength of the beam in meters. Defaults to 1.33e-10 (12.398/9.3 KeV).
        """

        return cls(get_detector_pixels(npixels), clen, poni, pixel_size, **kwargs)


def get_detector_pixels(npixels: tuple):
    """
    Generate pixel coordinate array in shape (-1, 2).

    Args:
        npixels (tuple[int]): Number of pixels in (vertical, horizontal) directions, e.g. (128, 128).

    Returns:
        ndarray: Pixel coordinate array.
    """
    return np.moveaxis(np.indices((npixels[0], npixels[1])), 0, -1)


def get_beam_center_lab(beam_direction: tuple, sd_vector: tuple):
    """Get beam center in lab system from beam incident direction vector and sample to detector norm vector.
        Equation 14 in E, J. C. et al. Journal of Synchrotron Radiation 25, 604–611 (2018)
        doi:10.1107/S1600577517016733

    Args:
        beam_direction (tuple): Beam incident direction vector.
        sd_vector (tuple): Sample to detector norm vector, its length is sample to detector distance.

    Returns:
        ndarray: The dimension is the same as input.
    """
    beam_hat = np.array(beam_direction) / np.linalg.norm(beam_direction)
    return np.linalg.norm(sd_vector) ** 2 / np.dot(sd_vector, beam_hat) * beam_hat


# TODO: Check orthogonal for each system and throw a warning. For sample related system. The detector is
