This is the readme for the models associated with the paper:

Guosheng Yi,Jiang Wang, Xile Wei, Bin Deng (2017) Dendritic properties control energy efficiency of action potentials in cortical pyramidal cells. Frontiers in Cellular Neuroscience

The matlab code is contributed by Guosheng Yi.

How to compile the files:
(1) Download and uncompress the files into the same directory.
(2) Open Matlab and go to that directory.

Usage:
(1) Model I. There are no active currents in its dendritic chamber. 
* Set Id=3, gc=0.5, and p=0.2, 0.4, 0.6, 0.8. Run ML_two_ode.m in this directory to reproduce the spike trains in Figure 1B.
* Set Id=2, p=0.5, and gc=0.2, 0.8, 1.6, 2.4. Run ML_two_ode.m in this directory to reproduce the spike trains in Figure 3B.
(2) Model II. There is only a Ca2+ current in its dendrite.Set Id=5, gc=0.3, and p=0.4, 0.6. Run ML_two_ode.m in this directory to reproduce Figure 6B.
(3) Model III. There is an inward Ca2+ current and an outward Ca2+-activated K+ current in its dendrite. Set Id=2, gc=0.6, and p=0.4, 0.6. Run ML_two_ode.m in this directory to reproduce Figure 9B.

ML_two_ode.m in each directory also includes the code for calculating the ionic currents underlying the spike train. If the users integrate Na+ current over the relevant duration for a given action potential, you will obtain total Na+ load, overlap Na+ load, and minimum Na+ load of the spike.

Thanks for your interest in these models.

Guosheng Yi, Jiang Wang and Xile Wei
School of Electrical and Information Engineering
Tianjin University, Tianjin 300072, China.
xilewei@tju.edu.cn




