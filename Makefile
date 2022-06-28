CC=g++
NVCC=/usr/local/cuda/bin/nvcc
CXXFLAGS= -fopenmp -O3 -Wextra -std=c++11 $(INCDIRS)
CUDAFLAGS= -std=c++11 -c -arch=sm_80 -gencode=arch=compute_80,code=sm_80 $(INCDIRS)
LIBS= -lopenblas -lpthread -lcudart -lcublas
LIBDIRS=-L/usr/local/cuda/lib64
INCDIRS=-I/usr/local/cuda/include -I./include


all: bellman.o kernels.o
	$(CC) -o bellman src/main.cpp src/bellman.cpp src/utilities.cpp bellman.o kernels.o $(LIBDIRS) $(INCDIRS) $(LIBS) $(CXXFLAGS)

kernels.o: src/kernels.cu
	$(NVCC) $(CUDAFLAGS) src/kernels.cu

bellman.o: src/bellman.cu
	$(NVCC) $(CUDAFLAGS) src/bellman.cu


clean:
	rm -rf test *.o