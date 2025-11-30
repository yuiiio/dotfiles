export MESA_SHADER_CACHE_DIR="$HOME/.cache/mesa_shader_cache_db"
export MESA_SHADER_CACHE_MAX_SIZE="10G"

export VK_LAYER_MESA_OVERLAY_CONFIG="position=bottom-left"

export PATH="$HOME/.local/bin:$PATH"
#export PATH="$PATH:$HOME/go/bin"

# export DXVK_FILTER_DEVICE_NAME="UHD Graphics 630"
export DXVK_HUD="devinfo,fps,frametimes,gpuload,version,api"
export DXVK_CONFIG_FILE="$HOME/.config/dxvk.conf"
export DXVK_LOG_LEVEL="none"

export radv_disable_ngg_gs="true"

#export VK_INSTANCE_LAYERS="VK_LAYER_MESA_overlay"

#need 32bit path maybe
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:/usr/local/lib32/pkgconfig:$PKG_CONFIG_PATH"
# use ldconfig /etc/ld.so.conf.d/local.conf instead
#export LD_LIBRARY_PATH="/usr/local/lib:/usr/local/lib32:$LD_LIBRARY_PATH"

# export __EGL_VENDOR_LIBRARY_FILENAMES="/usr/share/glvnd/egl_vendor.d/50_mesa.json"

# export IGPU_RENDER=`readlink -f /dev/dri/by-path/pci-0000:00:02.0-render`
# export MOZ_WAYLAND_DRM_DEVICE="$IGPU_RENDER"
export GDK_BACKEND="wayland"
export MOZ_ENABLE_WAYLAND="1"
export MOZ_WEBRENDER="1"
# export MOZ_DISABLE_RDD_SANDBOX="1"

#export SDL_VIDEODRIVER="wayland"
export QT_QPA_PLATFORM="wayland"
export XDG_SESSION_TYPE="wayland"

#export QT_XCB_GL_INTEGRATION="xcb_egl"
#export QT_WAYLAND_CLIENT_BUFFER_INTEGRATION="wayland-egl"
#export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
#export QTWEBENGINE_CHROMIUM_FLAGS=" --enable-oop-rasterization --enable-gpu-rasterization --enable-native-gpu-memory-buffers --use-gl=desktop"

#export LD_PRELOAD="libSDL2.so"

export PROTON_ENABLE_NVAPI="0"
export WINEDLLOVERRIDES="winemenubuilder.exe=d;nvapi64=d;nvapi=d;nvcuda=d;"

# export MOZ_DRM_DEVICE="$MOZ_WAYLAND_DRM_DEVICE"

export XDG_CURRENT_DESKTOP="wlroots"
export GTK_USE_PORTAL="0"

# export LIBVA_DRIVER_NAME="iHD"

export XKB_DEFAULT_OPTIONS="ctrl:nocaps"
#export XCURSOR_THEME="Adwaita"

export WLR_DRM_FORCE_LIBLIFTOFF="0"
export WLR_SCENE_DEBUG_DAMAGE="0"
export WLR_SCENE_HIGHLIGHT_TRANSPARENT_REGION="0"

export WINE_DISABLE_FULLSCREEN_HACK="1"
# export WINE_CPU_TOPOLOGY="8:0,1,2,3,4,5,6,7"

export WGPU_BACKEND="vulkan"

# export IGPU_CARD=`readlink -f /dev/dri/by-path/pci-0000:00:02.0-card`
# export WLR_DRM_DEVICES="$IGPU_CARD"

export WLR_RENDERER="gles2"
# export WLR_RENDERER="vulkan"

# for ccache
export PATH="/usr/lib/ccache/bin/:$PATH"
# for mingw & ccache
# export MINGW_GCC_VERSION=`x86_64-w64-mingw32-gcc --version | grep gcc | awk '{print $3}'` 

# ln -sf /usr/bin/ccache  /usr/lib/ccache/bin/x86_64-w64-mingw32-c++
# ln -sf /usr/bin/ccache  /usr/lib/ccache/bin/x86_64-w64-mingw32-cc
# ln -sf /usr/bin/ccache  /usr/lib/ccache/bin/x86_64-w64-mingw32-cpp
# ln -sf /usr/bin/ccache  /usr/lib/ccache/bin/x86_64-w64-mingw32-g++
# ln -sf /usr/bin/ccache  /usr/lib/ccache/bin/x86_64-w64-mingw32-gcc
# ln -sf /usr/bin/ccache  /usr/lib/ccache/bin/x86_64-w64-mingw32-gcc-$MINGW_GCC_VERSION

# ln -sf /usr/bin/ccache  /usr/lib/ccache/bin/i686-w64-mingw32-c++
# ln -sf /usr/bin/ccache  /usr/lib/ccache/bin/i686-w64-mingw32-cc
# ln -sf /usr/bin/ccache  /usr/lib/ccache/bin/i686-w64-mingw32-cpp
# ln -sf /usr/bin/ccache  /usr/lib/ccache/bin/i686-w64-mingw32-g++
# ln -sf /usr/bin/ccache  /usr/lib/ccache/bin/i686-w64-mingw32-gcc
# ln -sf /usr/bin/ccache  /usr/lib/ccache/bin/i686-w64-mingw32-gcc-$MINGW_GCC_VERSION
#

# my desktop setup is 7950x + 6900xt
# 7950x igpu is /dev/dri/by-path/pci-0000:0e:00.0-card 
# 6900xt is /dev/dri/by-path/pci-0000:03:00.0-card

export SSH_OPENOCD="pi4"
