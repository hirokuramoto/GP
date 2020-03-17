TARGET	=	go
OBJECTS	=	main.o	datain.o	kernel_mat.o	matrix_calc.o log_like.o
F90	=	gfortran
FFLAGS	=	-O	-fdefault-real-8 -fbounds-check
LDFLAGS	=	-llapack	-lblas
COMMON_MOD	=

.SUFFIXES	:	.o	.f90
.f90.o:
	${F90}	-c	$<	${FFLAGS}

${TARGET}	:	${OBJECTS}
	${F90}	-o	$@	${OBJECTS}	${LDFLAGS}

${OBJECTS}	:	${COMMON_MOD}

clean:
	rm -f ${TARGET} ${OBJECTS}
