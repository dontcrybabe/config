#!/bin/bash
pwd=$(pwd)
./configure --enable-cuda-nvcc --enable-cuda-llvm --enable-libnpp  --enable-opencl  \
 --enable-nonfree \
 --enable-gpl \
 --enable-opengl \
 --enable-libmp3lame --enable-libopenh264 --enable-libx264 --enable-libx265 --enable-libsvtav1 \
 --enable-libvvenc --enable-libvpx \
 --arch=x86_64 --target-os=win64  \
 --disable-debug \
 --disable-shared \
 --enable-static \
 --pkg-config-flags="--static" \
 --extra-libs="-lpthread -lm" \
 --enable-pthreads \
 --enable-optimizations \
 --enable-cross-compile \
 --cc=x86_64-w64-mingw32-gcc --cxx=x86_64-w64-mingw32-g++ \
 --cross-prefix=x86_64-w64-mingw32ucrt- \
 --bindir=$pwd/bin \
 --extra-cxxflags="-I/usr/local/cuda/include -I/usr/include/wels -O3 -march=native -mtune=native" \
 --extra-cflags="-I/home/dontcrybabe/vvenc/install/include -I/usr/local/cuda/include -I/usr/include/wels -O3 -march=native -mtune=native" \
 --extra-ldflags="-L/usr/local/cuda/lib64 -L/usr/local/lib -L/usr/local/lib/pkgconfig -L/home/dontcrybabe/vvenc/install/lib"
