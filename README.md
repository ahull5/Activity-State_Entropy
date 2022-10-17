# Activty-State_Entropy
Matlab code used for calculating Activity-State Entropy and for generating the simulated fMRI data in "Activity-State Entropy: A Novel Brain Entropy Measure Based on Spatial Patterns of Activity"

ActEn.m calculates the Activity-State Entropy of a matrix of fMRI data

simulate_random.m generates simulated voxel time courses from random activity states that oscillate with random periods. 

simulate_positive.m generates simulated voxel time courses from random activity states but orders the periods of the activity states such that there is a positive correlation between Activity-State Entropy and Sample Entropy/Dispersion Entropy

simulate_positive.m generates simulated voxel time courses from random activity states but orders the periods of the activity states such that there is a negative correlation between Activity-State Entropy and Sample Entropy/Dispersion Entropy
