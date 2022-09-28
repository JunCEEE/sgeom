import numpy as np
import h5py
from glob import glob


class EMCgeom(object):
    """The EMCgeom class."""
    def __init__(self, geom_fn: str):
        super(EMCgeom, self).__init__()
        with h5py.File(geom_fn, 'r') as h5:
            self.ewald_rad = h5['ewald_rad'][()]
            self.detd = h5['detd'][()]
            self.qx = h5['qx'][()]

    def load_data_dir(self, data_dir: str):
        flist = glob(data_dir + '/output_*.h5')
        flist.sort()
        recon_data_fn = flist[0]
        with h5py.File(recon_data_fn, 'r') as h5:
            self.intens = h5['intens'][()]

    def set_lambda(self, photon_lambda: float):
        """Except lambda in Angstrom"""
        self.photon_lambda = photon_lambda

    @property
    def reciprocal_shape(self):
        intens_squeeze = np.squeeze(self.intens)
        return intens_squeeze.shape

    @property
    def q_sep(self):
        return 1 / self.photon_lambda / self.ewald_rad

    @property
    def q_max_detector(self):
        return np.max(self.qx) * self.q_sep

    @property
    def q_max_volume(self):
        return (self.reciprocal_shape[0] - 1) / 2 * self.q_sep


if __name__ == "__main__":
    data_dir = '/gpfs/exfel/data/user/juncheng/hydratedProject/src/analysis/EMC/dragonfly/w0_rad_nocomption/w0_rad_nocompton_0001/data'
    geom_fn = '/gpfs/exfel/data/user/juncheng/hydratedProject/src/analysis/EMC/hydrated_geom.h5'
    # geom_fn = '/gpfs/exfel/data/user/juncheng/EMCProject/src/controller/s15_r112_p_only/recon_0001/S15_r112_poission_only.h5'
    emc_geom = EMCgeom(geom_fn)
    emc_geom.load_data_dir(data_dir)

    emc_geom.set_lambda(2.5)
    # emc_geom.set_lambda(2.07)

    mesh_length = emc_geom.reciprocal_shape
    voxel_length = emc_geom.q_sep
    q_max_detector = np.max(emc_geom.qx) * voxel_length
    q_max_volume = (mesh_length[0] - 1) / 2 * voxel_length
    print(f'voxel_length = {voxel_length}')
    print(f'mesh_length = {mesh_length}')
    print(f'q_max_detector = {q_max_detector}')
    print(f'q_max_volume = {q_max_volume}')
    print(f'q_max_detector = {emc_geom.q_max_detector}')
    print(f'q_max_volume = {emc_geom.q_max_volume}')
