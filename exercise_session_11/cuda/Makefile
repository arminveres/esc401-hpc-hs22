cc=nvcc
CFLAGS += --gpu-architecture=sm_60

cpi:
	nvcc ${CFLAGS} cpi_cuda.cu gettime.c -o cpi
loop_cpi:
	nvcc ${CFLAGS} cpi_cuda_loop.cu gettime.c -o loop_cpi

clean:
	rm cpi loop_cpi -f
