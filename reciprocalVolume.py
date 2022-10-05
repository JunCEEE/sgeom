import h5py as h5

# from EMCgeom import EMCgeom
import sgeomplus as sp

# import pysingfel as ps
import skopi as sk
import skopi.gpu as pg

# Create a particle object
particle = sk.Particle()
# particle.read_pdb('./4V7V.pdb', ff='WK')

pdb_file = "data/2nip.pdb"
particle.read_pdb(pdb_file)

# Load beam
# beam = ps.Beam(photon_energy=4960, fluence=1.58e12, focus_radius=1.13e-7)

# Load and initialize the detector
# det_size = 81 * 1.2e-3  # m
# det_distance = 0.13  # m
# det = ps.SimpleSquareDetector(N_pixel=81,
#                               det_size=det_size,
#                               det_distance=det_distance,
#                               beam=beam)

# Load EMC parameters
# data_dir = "data"
# geom_fn = "data/hydrated_geom.h5"
# emc_geom = EMCgeom(geom_fn)
# emc_geom.load_data_dir(data_dir)
# emc_geom.set_lambda(2.5)


def run(conv: sp.GeometryConverter):
    mesh = conv.reciprocal_mesh(
        conv.lab_to_reciprocal(conv.detector_to_lab(conv.all_pixels()))
    )

    volume = pg.calculate_diffraction_pattern_gpu(
        mesh, particle, return_type="intensity"
    )

    with h5.File("reciprocal_volume.h5", "w") as f:
        f.create_dataset("volume", volume.shape, data=volume)
        f.create_dataset("q_map", mesh.shape, data=mesh * 1e-10)

    return volume
