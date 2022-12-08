cc=nvcc
CFLAGS += --gpu-architecture=sm_60

cpi:
	nvcc ${CFLAGS} cpi_cuda.cu gettime.c -o cpi
