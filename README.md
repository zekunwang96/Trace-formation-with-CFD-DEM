# Trace-formation-with-CFD-DEM
This repository contains the CFDEM (www.cfdem.com) and Matlab codes with our own developments to reproduce trace fossils in different environments (three zip files) and deduce putative trace-makers (CurveGithub.m). You can also get access to a free software for trace-maker identification through https://zenodo.org/records/10259553.

Codes.zip contains the CFDEM solvers to reproduce translational and rotational motion of the trace-makers/appendages (cfdemSolverPisoSTL0, cfdemSolverPisoSTL), along with the necessary semi-resolved force models (gradPForce, viscForce, GidaspowDragsemi). Steps to compile these codes are written in Readme. If you want to use relatively coarse mesh (mesh size at least three times larger than sediment diameter) to accelerate simulations, please use the default unresolved forces models. In that case, only solvers needs to be compiled. But the force model lists in case/CFD/constant/couplingProperies needs to be adjusted. Please refer to the benchmark cases in www.cfdem.com to learn to use CFDEM.

Benchmark_case.zip contains a benchmark validation of the moving cube on submerged sands. Appendage.zip contains a moving appendage on subaerial wet sands.


