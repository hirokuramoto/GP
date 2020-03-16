TARGET	=	go
OBJECTS	=	main.o	datain.o	kernel_mat.o	log_likelihood.o
F90	=	gfortran
FFLAGS	=	-O	-fdefault-real-8 -fbounds-check
COMMON_MOD	=

.SUFFIXES	:
.SUFFIXES	:	.o	.f90
.f90.o:
	${F90}	-c	$<	${FFLAGS}

${TARGET}	:	${OBJECTS}
	${F90}	-o	$@	${OBJECTS}

${OBJECTS}	:	${COMMON_MOD}
