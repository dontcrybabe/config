export LLVM=1
export LLVM_IAS=1
export CC=clang
export CXX=clang++
#export LD=lld
#export CC_LD=lld
#export CXX_LD=lld
export AR=llvm-ar
export NM=llvm-nm
export STRIP=llvm-strip
export OBJCOPY=llvm-objcopy
export OBJDUMP=llvm-objdump
export READELF=llvm-readelf
export RANLIB=llvm-ranlib

export HOSTCC=clang
export HOSTCXX=clang++
export HOSTAR=llvm-ar
#export HOSTLD=lld

export CXXFLAGS="-ferror-limit=0 -O3 -march=znver3 -mtune=znver3 -flto=full -ffat-lto-objects"
export CFLAGS="-ferror-limit=0 -O3 -march=znver3 -mtune=znver3 -flto=full -ffat-lto-objects"
export LDFLAGS="-L/opt/cuda/nvvm/lib64 -L/opt/cuda/lib -L/opt/cuda/targets/x86_64-linux/lib -L/usr/local/lib -L/usr/lib $LDFLAGS"
export CFLAGS="-I/opt/cuda/nvvm/include -I/opt/cuda/include -I/opt/cuda/targets/x86_64-linux/include -I/usr/local/include -I/usr/include $CFLAGS"
export LD_LIBRARY_PATH="/usr/local/lib:/usr/lib:/opt/cuda/lib"

export PKG_CONFIG_PATH="/usr/lib/pkg/config/:/usr/local/lib/pkgconfig/:$PKG_CONFIG_PATH"

export MAKEFLAGS="-j16"
export NINJAFLAGS="-j16"
export RUSTFLAGS="-C opt-level=3"
export EDITOR=nano
