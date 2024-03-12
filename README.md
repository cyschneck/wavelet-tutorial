# wavelet-tutorial
Tutorial for learning and working with Wavelets

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

## Overview
Wavelets are a powerful tool to analyze time-series data and find the base frequencies that are creating a complex signal. 

## Motivation and Background

### Fourier Transform

### Short-Time Fourier Transform

Sometimes also refered to as Windowed Fourier Transform

## Wavelets

### "A Practical Guie to Wavelet Analysis"

["A Practical Guide to Wavelet Analysis" (Torrence and Compo)](https://psl.noaa.gov/people/gilbert.p.compo/Torrence_compo1998.pdf)

### Functionality

NCL Wavelet inputs: time series and significance levels

- 1D array data with length N
- mother wavelet: Morlet, Paul, DOG
- dt: sampling time (time between each y value)
- mother wavelet parameter
	- Morlet: k0 (wave number) = 6 (default)
	- Paul: m (order) = 4 (default)
	- DOG: m (m-th derivative) = 2 (default)
- s0: smallest scale of wavelet, typically equal to 2*dt (twice the sampling time)
	- Morlet: s0 = dt
	- Paul: s0 = dt/4
- dj: spacing between discrete scales, typically dj = 0.25
	- Smaller dj will increase resolution but increase computation time
- jtot: scales (integer number), range from s0 (2*dt) to s0*2^((jtot-1)*dj)
	- Max range set to smallest scale * 2 ^ ( (scale - 1) * space between scales)
	- Commonly, rounded to integer, jtot = 1 + log((length data * sampling time)/spacing between scale)/log(2)
	- (rounded to an integer) jtot = 1 + log((N*dt)/s0)/log(2)
- npad: number of points (including padding) used for wavelet transform, typically a power of 2
	- Padding must be greater than/equal to length of data (N)
	- If npad > N, zeroes are padded to end of time series
	- Most commonly, npad = N (no padding)
- noise
	- significance testing with noise
	- noise = 0 for white noise background
	- noise = 1 for red noise background
- significance testing
	- isigtest = 0 for regular chi-square test (equ 18 in Torrence and Compo)
	- isigtest = 1 for time-average test on global wavelet spectrum
- significance level
	- typically, siglvl = 0.95

Returns:

- 3D array (wave transform) with dimensions 2 x jtot x N
	- wave phase: 1D array jtot*N containing 
	- mean: scalar containing mean of input series
	- stdev: 1D scalar containing STD fo input
	- lag1: scalar containing lag-1 autcorrelation of input series
	- r1: scalar of used in significance testing
	- dof: degrees-of-freedom for significance testing
	- scale: containing the wavelet scales used
	- period: contains the Fourier period corresponding to scale
	- gws: global wavelet spectrum
	- coi: e-folding factor used for the cone of influence
	- fft_theor: theoretical red-noise spectrum versus scale
	- signif: significance levels versus scale
	- cdelta: constant cdelta for mother wavelet
	- psi0: psi(0) for the mother wavelet

