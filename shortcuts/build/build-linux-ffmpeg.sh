#!/bin/bash

./configure --enable-cuda-nvcc --enable-cuda-llvm --enable-libnpp  --enable-opencl  \
 --enable-nonfree \
 --enable-gpl \
 --enable-opengl \
 --enable-libmp3lame --enable-libopenh264 --enable-libx264 --enable-libx265 --enable-libsvtav1 \
 --enable-nvenc \
 --enable-libvvenc --enable-libvpx \
 --disable-debug \
 --disable-shared \
 --enable-static \
 --pkg-config-flags="--static" \
 --extra-libs="-lpthread -lm" \
 --enable-pthreads \
 --cc=clang --cxx=clang++ \
 --enable-optimizations \
 --extra-cxxflags="-fuse-ld=lld -I/usr/local/cuda/include -I/usr/include/wels -march=native -O3 -mtune=native" \
 --extra-cflags="-fuse-ld=lld -I/home/dontcrybabe/vvenc/install/include -I/usr/local/cuda/include -I/usr/include/wels -march=native -O3 -mtune=native" \
 --extra-ldflags="-fuse-ld=lld -L/usr/local/cuda/lib64 -L/usr/local/lib -L/usr/local/lib/pkgconfig -L/home/dontcrybabe/vvenc/install/lib"
