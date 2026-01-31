#!/bin/bash -ex

exec meson setup \
    -Dprefix=~/mesa-test -Dgallium-drivers= -Dvulkan-drivers=amd build

# ninja -C build/ install
# VK_DRIVER_FILES=~/mesa-test/share/vulkan/icd.d/radeon_icd.x86_64.json


#
#exec meson setup \
#  --buildtype     debug \
#  -D              b_sanitize=address,undefined \
#  --wrap-mode=nofallback \
#  --force-fallback-for=syn,paste,rustc-hash \
#  -D b_ndebug=false \
#  -D platforms=x11,wayland \
#  -D gallium-drivers=radeonsi,zink,llvmpipe,softpipe \
#  -D vulkan-drivers=amd \
#  -D egl=enabled \
#  -D gallium-extra-hud=true \
#  -D gallium-rusticl=false \
#  -D gallium-va=enabled \
#  -D gbm=enabled \
#  -D gles1=disabled \
#  -D gles2=enabled \
#  -D glvnd=enabled \
#  -D glx=dri \
#  -D libunwind=enabled \
#  -D llvm=enabled \
#  -D lmsensors=enabled \
#  -D opengl=true \
#  -D zstd=auto \
#  -D valgrind=enabled \
#  "$@"
