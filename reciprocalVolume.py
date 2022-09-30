import sys
import numpy as np
import matplotlib.pyplot as plt
import h5py as h5
import time
from matplotlib.colors import LogNorm
from EMCgeom import EMCgeom

# import pysingfel as ps
import skopi as sk
import skopi.gpu as pg
import skopi.geometry as pgeom

# Create a particle object
particle = sk.Particle()
# particle.read_pdb('./4V7V.pdb', ff='WK')

pdb_file = "./2nip.pdb"
H5_FILE = '/gpfs/exfel/data/user/juncheng/hydratedProject/data/simulation/w0_link/pmi_out_0000001.h5'
datasetname = '/data/snp_' + '{0:07}'.format(1)
# particle.read_h5file(H5_FILE, datasetname)
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
data_dir = '/gpfs/exfel/data/user/juncheng/hydratedProject/src/analysis/EMC/dragonfly/w0_rad_nocomption/w0_rad_nocompton_0001/data'
geom_fn = '/gpfs/exfel/data/user/juncheng/hydratedProject/src/analysis/EMC/hydrated_geom.h5'
emc_geom = EMCgeom(geom_fn)
emc_geom.load_data_dir(data_dir)
emc_geom.set_lambda(2.5)

mesh_length = emc_geom.reciprocal_shape[0]
max_q = emc_geom.q_max_volume * 1e10
# max_q = emc_geom.q_max_volume * 2 * np.pi * 1e10

# # Calculate the 3D diffraction volume

mesh, voxel_length = pgeom.get_reciprocal_mesh(mesh_length, max_q)

# Calculate the 3D diffraction intensity volume
volume = pg.calculate_diffraction_pattern_gpu(mesh,
                                              particle,
                                              return_type='intensity')

print(voxel_length * 1e-10)
print(mesh.max() * 1e-10)
# print(voxel_length * 1e-10 / 2 / np.pi)
# print(mesh.max() * 1e-10 / 2 / np.pi)
print(mesh.max() / voxel_length)

with h5.File('reciprocal_volume.h5', 'w') as f:
    f.create_dataset('volume', volume.shape, data=volume)
    # f.create_dataset('q_map', mesh.shape, data=mesh * 1e-10 / 2 / np.pi)
    f.create_dataset('q_map', mesh.shape, data=mesh)
