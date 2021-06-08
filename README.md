# rcaExtra - sweep extension (BETA)
This repository contains a fork of [svndl/rcaExtra](https://github.com/svndl/rcaExtra), which hosts the **rcaExtra** toolbox written by [Alexandra Yakovleva](https://github.com/leksea) for MATLAB at Stanford University. The toolbox is intended as a front-end for Reliable Components Analysis (RCA) to be used with EEG/fMRI/MEG. It is currently designed to make use of the RCA core toolbox [dmochow/rca](https://github.com/dmochow/rca) written by [Jacek P. Dmochowski](https://github.com/dmochow).

## About this fork
This fork is intended to hosts extensions to cover sweep EEG experiments with the rcaExtra toolbox, as the original rcaExtra only covers steady-state time- and frequency-domain EEG data. I'm keeping this as a fork for now, with the aim of merging the extensions into the main svndl/rcaExtra once the code is deemed clean and stable enough. The extension is intended to be fully compatible with the original rcaExtra toolbox.

## Requirements for using the toolbox
At the present moment, this toolbox depends on the following MATLAB toolboxes:
* [dmochow/rca](https://github.com/dmochow/rca) - core RCA toolbox
* [svndl/mrC](https://github.com/svndl/mrC) - dependency for plotting scalp topographies

Make sure to have the two required repositories cloned and on your MATLAB path. Be careful to remove any reference to the original rcaExtra from your MATLAB path before using this version in order to avoid conflicts.

## Basic usage
!!! PLACEHOLDER !!!

## TODOs
* Diagnostics/sanity check: Writing a function to extract a re-projected single channel as a sanity check for the underlying RCA computations
* `rcaExtra_plotSweepProjAmplitudesSummary_beta()`: this function is a temporary summary plot for swept data. It will plot sweep amplitudes and phases for each reliable component and frequency. **Error estimations in these plots needs to be fixed: at the moment, it will just re-calculate the standard error of the means of the individual participants' sweeps and use that as error estimates around the signal amplitudes.**
* Diagnostics/sanity check: fix the diagnostic RCA plots produced by the `rca` toolbox
* Incorporate mrC's `plotOnEgi()` plotting function into the repository: it makes sense to integrate the topography plotting capabilities from `mrC`, as it is currently a requirement only because of this plotting function
