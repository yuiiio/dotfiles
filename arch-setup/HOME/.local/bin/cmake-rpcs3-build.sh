export CC="/usr/bin/clang"
export CXX="/usr/bin/clang++"
export LINKER=lld
export AR=/usr/bin/llvm-ar
export RANLIB=/usr/bin/llvm-ranlib

export CFLAGS="$CFLAGS -fuse-ld=${LINKER}"

cmake ../rpcs3 \
    -DUSE_SDL=ON \
    -DUSE_SYSTEM_SDL=ON \
    -DUSE_SYSTEM_FFMPEG=ON \
    -DUSE_FAUDIO=ON \
    -DCMAKE_C_FLAGS="$CFLAGS" \
    -DCMAKE_CXX_FLAGS="$CFLAGS" \
    -DCMAKE_AR="$AR" \
    -DCMAKE_RANLIB="$RANLIB" \

make -j16
