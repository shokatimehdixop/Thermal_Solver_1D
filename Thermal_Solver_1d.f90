

! program to solving one dimensional heat transfer equation with finite differnece method
program TDMA
implicit double precision (a-h,o-z)
include 'par.f90'
! array initialization
x=0.
aP=0.
aE=0.
aW=0.
p=0.
q=0.
T=0.
cond=0.
sp=0.0
sc=0.
d=0.
! Input parameters
call input
!Array construction
call grid
!Conductivity values
call conduc
call source
!Calculate coeeficients, aw,ae,ap
call coeffs
! Impose boundary conditions
call bc
! generate values of T
call solve
! print results
call output
End program TDMA
!-----------------------------------------------------------------------------------------
subroutine input
implicit double precision (a-h,o-z)
include 'par.f90'
open(10,file='pqinput',status='unknown')
read(10,*) deltaxread(10,*) ibcflagw
read(10,*) ibcflage
if(ibcflagw .eq. 0) read(10,*) T1
if(ibcflage .eq. 0) read(10,*) TNx
if(ibcflagw .eq. 1) read(10,*) qwb
if(ibcflage .eq. 1) read(10,*) qeb
read(10,*) condvalue
close(10)
end subroutine input
!-----------------------------------------------------------------------------------------
subroutine grid
implicit double precision (a-h,o-z)
include 'par.f90'
do i=1,Nx-1
x(i+1)= x(i)+ deltax
end do
end subroutine grid
!-----------------------------------------------------------------------------------------
subroutine conduc
implicit double precision (a-h,o-z)
include 'par.f90'
do i=1,Nx
cond(i)=condvalue
end do
end subroutine conduc
!-----------------------------------------------------------------------------------------
subroutine source
implicit double precision(A-H,O-Z)
include 'par.f90'
do i=1,Nx
Sc(i)=0.
Sp(i)=0.0
end do
end subroutine source
!-----------------------------------------------------------------------------------------
subroutine coeffs
implicit double precision (a-h,o-z)
include 'par.f90'
do i=1,Nx-1
rcond=2.0*(cond(i)*cond(i+1))/(cond(i)+ cond(i+1))aE(i)=rcond/deltax
end do
! aW is a real vector, lower diagonal element of system.
do i=2,Nx
rcond=2.0*(cond(i-1)*cond(i))/(cond(i-1)+ cond(i))
aW(i)=rcond/deltax
end do
aw(1)=0.0
ae(Nx)=0.0
! aP is a real vector, Main diagonal element of system.
do i=1,Nx
aP(i)= aE(i) + aW(i) -sp(i)*deltax
end do
do i=1,Nx
d(i)=Sc(i)*deltax
end do
end subroutine coeffs
!-----------------------------------------------------------------------------------------
subroutine bc
implicit double precision (a-h,o-z)
include 'par.f90'
if (ibcflagw .eq. 0) then
ap(1) = 1.0
ae(1) = 0.0
aw(1) = 0.0
d(1) = t1
endif
if(ibcflagw .eq. 1) then
d(1)=d(1)+qwb
end if
if(ibcflage .eq. 0) then
ap(Nx) = 1.0
ae(Nx)=0.0
aw(Nx)=0.0
d(Nx)=TNx
end if
if(ibcflage .eq. 1) then
d(Nx)=d(Nx)+qeb
end if
end subroutine bc
!-----------------------------------------------------------------------------------------
subroutine solve
implicit double precision (a-h,o-z)
include 'par.f90'!---------------- Backward substitution -------------------
! T(i)=p(i)*T(i+1)+q(i)
! p(i)=b(i)/(aP(i)-aW(i)*p(i-1))
p(1)=ae(1)/ap(1)
q(1)=d(1)/ap(1)
do k=2,Nx
p(k)=aE(k)/(aP(k)- aW(k)*p(k-1))
q(k)=(d(k)+ aW(k)*q(k-1))/(aP(k)- aW(k)*p(k-1))
end do
T(Nx)=q(Nx)
do k=Nx-1,1,-1
T(k)=p(k)*T(k+1) + q(k)
end do
end subroutine solve
!-----------------------------------------------------------------------------------------
subroutine output
implicit double precision (a-h,o-z)
include 'par.f90'
open(2, file='xresults.txt', status='unknown')
do k=1,Nx
write(2,*) x(k), T(k)
end do
end subroutine output