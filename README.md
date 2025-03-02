# Thermal_Solver_1D
The geothermal gradient is defined as the rate at which the Earth's temperature rises with increasing depth [1,2]. This phenomenon signifies the transfer of thermal energy from the planet's warmer interior to its cooler surface [3].

The Earth's internal heat originates from several key sources [3]:
Residual Heat from Planetary Accretion: This is the thermal energy retained from the Earth's formation, resulting from the gravitational energy released during the planet's accretion process.
Heat from Radioactive Decay: Radioactive isotopes, such as uranium, thorium, and potassium, present in the Earth's mantle and crust, undergo decay and release energy, significantly contributing to the planet's internal heat.
Latent Heat from Core Crystallization: As the liquid iron in the outer core solidifies onto the inner core, latent heat is released, further contributing to the Earth's thermal budget.
Other Potential Sources: There may be additional mechanisms generating heat within the Earth, though these are less understood and require further investigation.
# Publishing My Early Fortran Code: A Step into GitHub
This title succinctly captures the essence of the paragraph, highlighting the author's decision to share their early Fortran code on GitHub as a significant milestone in their programming journey.

# One-Dimensional Heat Transfer Solver
This project implements a Fortran program to solve the one-dimensional heat transfer equation using a finite difference method and the Tri-Diagonal Matrix Algorithm (TDMA). The code is organized into clear subroutines for input handling, grid generation, conductivity calculation, coefficient setup, boundary conditions, solving the linear system, and output generation.

# Interesting Techniques
#  Finite Difference Discretization:
Implements a numerical method to approximate the heat equation, turning a differential problem into a linear system.

#  Tri-Diagonal Matrix Algorithm (TDMA):
Uses TDMA for efficiently solving the resulting linear system. This algorithm is a classic approach in numerical methods for partial differential equations.

#  Harmonic Averaging for Conductivity:
The code computes an effective conductivity using harmonic averages to better represent material interfaces.

#  Implicit Double Precision:
Ensures numerical accuracy by using implicit double precision for all floating point operations.

# Technologies & Libraries
#  Fortran:
The program is written in Fortran, using the implicit typing feature and module inclusion via include 'par.f90'.

#  TDMA Algorithm:
A well-known method in computational physics and engineering for solving tridiagonal systems. More details on the algorithm can be found on Wikipedia.
Note: This project does not rely on external fonts or web libraries as it is focused on numerical computation.

# References:

1-	Wikimedia Commons [Online], Available: https://commons.wikimedia.org/wiki/File:Blender3D_EarthQuarterCut.jpg

2-	https://energyeducation.ca/encyclopedia/Geothermal_gradient

3-	https://en.wikipedia.org/wiki/Geothermal_gradient

