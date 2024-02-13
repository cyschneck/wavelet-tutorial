# wavelet-tutorial
Tutorial for working with Wavelets

## Overview
Wavelets are a powerful tool to find the base frequencies that are creating a complex signal. 

## Motivation and Background

### Fourier Transform

### Short-Time Fourier Transform

Sometimes also refered to as Windowed Fourier Transform

## Wavelets

### "A Practical Guie to Wavelet Analysis"

["A Practical Guide to Wavelet Analysis" (Torrence and Compo)](https://psl.noaa.gov/people/gilbert.p.compo/Torrence_compo1998.pdf)

## Practice
Create new conda environment for Jupyter notebook

```
conda env create -f environment.yml
```

Activate new environment

```
conda activate wavelet_tutorial
```

Start JupyterLab and open in local browser at localhost:8888

```
jupyter lab
```

<details closed>
<summary>JupyterLab Issues and Solutions:</summary>
<br>
If the browser opens, but JupyterLab displays an empty page try `http://127.0.0.1:8888/lab` instead of the default `http://localhost:8888/lab`. If this does not work, try switching browsers (Firefox, Chrome, Safari, etc...)

If the browser opens, but JupyterLab prompts you for a password/token: `Token authentication is enabled`

The token that JupyterLab is expecting can be found in the terminal where `jupyter lab` command is running as `http://localhost:8888/lab?token=<TOKEN/PASSWORD>` or `http://127.0.0.1:8888/lab?token=<TOKEN/PASSWORD>`

An example of the Jupyter output:

```
[I 2024-01-17 11:40:47.517 ServerApp] Jupyter Server 2.10.0 is running at:
[I 2024-01-17 11:40:47.517 ServerApp] http://localhost:8888/lab?token=b735c83f6f7a7d31a60cb773fc9bf3b392b14227396e26c3
[I 2024-01-17 11:40:47.517 ServerApp]     http://127.0.0.1:8888/lab?token=b735c83f6f7a7d31a60cb773fc9bf3b392b14227396e26c3
[I 2024-01-17 11:40:47.517 ServerApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[C 2024-01-17 11:40:47.547 ServerApp]

    To access the server, open this file in a browser:
        file:///home/user/.local/share/jupyter/runtime/jpserver-6001-open.html
    Or copy and paste one of these URLs:
        http://localhost:8888/lab?token=b735c83f6f7a7d31a60cb773fc9bf3b392b14227396e26c3
        http://127.0.0.1:8888/lab?token=b735c83f6f7a7d31a60cb773fc9bf3b392b14227396e26c3
```
</details>

