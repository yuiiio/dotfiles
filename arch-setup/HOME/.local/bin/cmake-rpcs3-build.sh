
# git submodule -q update --init $(awk '/path/ && !/llvm/ && !/opencv/ && !/libsdl-org/ && !/curl/ && !/zlib/ && !/discord-rpc/ && !/feralinteractive/ { print $3 }' .gitmodules)

export CC="/usr/bin/clang"
export CXX="/usr/bin/clang++"
export LINKER=lld
export AR=/usr/bin/llvm-ar
export RANLIB=/usr/bin/llvm-ranlib

export CFLAGS="-O2 -pipe -fPIC"
export LINKER_FLAG="-fuse-ld=${LINKER}"

CXXFLAGS="${CFLAGS}"
LDFLAGS="-Wl,-O1,--as-needed,--sort-common,-z,relro ${CFLAGS}"

cmake ../rpcs3 \
    -DUSE_SYSTEM_CURL=ON                               \
    -DUSE_SDL=ON \
    -DUSE_SYSTEM_SDL=ON \
    -DUSE_SYSTEM_FFMPEG=ON \
    -DUSE_SYSTEM_OPENCV=ON \
    -DUSE_DISCORD_RPC=OFF                               \
    -DUSE_GAMEMODE=OFF \
    -DCMAKE_C_FLAGS="${CFLAGS}" \
    -DCMAKE_CXX_FLAGS="${CFLAGS}" \
    -DCMAKE_AR="${AR}" \
    -DCMAKE_RANLIB="${RANLIB}" \
    -DCMAKE_EXE_LINKER_FLAGS="${LINKER_FLAG}"          \
    -DCMAKE_MODULE_LINKER_FLAGS="${LINKER_FLAG}"       \
    -DCMAKE_SHARED_LINKER_FLAGS="${LINKER_FLAG}"       \
    -DOpenGL_GL_PREFERENCE=LEGACY                      \
    -DUSE_NATIVE_INSTRUCTIONS=OFF \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \

make -j16
