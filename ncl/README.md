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

Run script within ncl directory

```
ncl wavelet_WORKING.ncl
```

