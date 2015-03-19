CUDA_CFLAGS := $(shell pkg-config --cflags cudart-6.5 cublas-6.5 cufft-6.5 nppc-6.5 nppi-6.5 npps-6.5)
CUDA_LIBS := $(shell pkg-config --libs cudart-6.5 cublas-6.5 cufft-6.5 nppc-6.5 nppi-6.5 npps-6.5)

OPENCV_CFLAGS := $(shell pkg-config --cflags opencv)
OPENCV_LIBS := $(shell pkg-config --libs opencv)

all: stitching

stitching: main.o blender.o
	$(CXX) $(LDFLAGS) main.o blender.o $(OPENCV_LIBS) $(CUDA_LIBS) -o stitching

main.o: main.cpp
	$(CXX) $(CXX_FLAGS) $(OPENCV_CFLAGS) $(CUDA_CFLAGS) -o main.o -c main.cpp

blender.o: blender.cpp
	$(CXX) $(CXX_FLAGS) $(OPENCV_CFLAGS) $(CUDA_CFLAGS) -o blender.o -c blender.cpp


clean:
	rm -f main.o blender.o
	rm -f stitching