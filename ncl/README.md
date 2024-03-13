# wavelet-tutorial
Running NCL within conda

## Conda
Create [new conda environment](https://www.ncl.ucar.edu/Download/conda.shtml)

```
conda create -n ncl_stable -c conda-forge ncl
```

Activate new environment

```
source activate ncl_stable
```

Run power spectrum within ncl directory

```
ncl wavelet_POWER.ncl
```

Run phase spectrum within ncl directory

```
ncl wavelet_PHASE.ncl
```

