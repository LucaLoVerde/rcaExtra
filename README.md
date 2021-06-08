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
