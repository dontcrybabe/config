unset LLVM
unset LLVM_IAS

export CC=gcc
export CXX=gcc
export LD=lld
export CC_LD=lld
export CXX_LD=lld
export AR=ar
export NM=nm
export OBJCOPY=objcopy
export OBJDUMP=objdump
export READELF=readelf
export RANLIB=ranlib
export HOSTCC=gcc
export HOSTCXX=gcc
export HOSTAR=ar
export HOSTLD=lld
#unset CXXFLAGS="-O3 -march=znver3 -mtune=znver3 -flto=thin"
#unset CFLAGS="-O3 -march=znver3 -mtune=znver3 -flto=thin"
unset CXXFLAGS
unset CFLAGS
unset CC CXX LD CC_LD CXX_LD AR NM OBJCOPY OBJDUMP READELF RANLIB HOSTCC HOSTCXX HOSTAR HOSTLD
export MAKEFLAGS="-j16"
export NINJAFLAGS="-j16"
export RUSTFLAGS="-C opt-level=3"
export EDITOR=nano
