! Par.f90 - Basic parameter and variable declarations for the TDMA heat transfer solver
! This file contains simple declarations for all variables used in the program.

implicit double precision (a-h, o-z)

! Define the number of grid points
      integer, parameter :: Nx = 100

! Arrays for grid positions and coefficients
      double precision, dimension(Nx) :: x       
      double precision, dimension(Nx) :: aP     
      double precision, dimension(Nx) :: aE       
      double precision, dimension(Nx) :: aW       

! TDMA helper arrays and temperature solution
      double precision, dimension(Nx) :: p       
      double precision, dimension(Nx) :: q        
      double precision, dimension(Nx) :: T       

! Material properties and source terms
      double precision, dimension(Nx) :: cond    
      double precision, dimension(Nx) :: Sc      
      double precision, dimension(Nx) :: Sp       

! Right-hand side vector for the system of equations
      double precision, dimension(Nx) :: d

! Scalar variables for simulation parameters
      double precision :: deltax, deltaxread       
      double precision :: condvalue, rcond           
      double precision :: t1, TNx                 
      double precision :: qwb, qeb                  

! Boundary condition flags
      integer :: ibcflagw, ibcflage

