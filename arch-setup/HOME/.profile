export PATH="$HOME/.local/bin:$PATH"
#export PATH="$PATH:$HOME/go/bin"

# export DXVK_FILTER_DEVICE_NAME="UHD Graphics 630"
export DXVK_HUD="devinfo,fps,frametimes,gpuload,version,api"
export DXVK_CONFIG_FILE="$HOME/.config/dxvk.conf"
export DXVK_LOG_LEVEL="none"

export VKD3D_CONFIG="dxr"

export SDL_GAMECONTROLLERCONFIG="030075c1091200000100000011010000,usbd-human-interface-device Rusty joystick,platform:Linux,a:b0,b:b1,x:b2,y:b3,back:b6,start:b7,leftstick:b9,rightstick:b10,leftshoulder:b4,rightshoulder:b5,dpup:h0.1,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,leftx:a0,lefty:a1,rightx:a3,righty:a4,lefttrigger:a2,righttrigger:a5,"

#export VK_INSTANCE_LAYERS="VK_LAYER_MESA_overlay"

#need 32bit path maybe
# export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:/usr/local/lib32/pkgconfig:$PKG_CONFIG_PATH"
# export LD_LIBRARY_PATH="/usr/local/lib:/usr/local/lib32:$LD_LIBRARY_PATH"

# export __EGL_VENDOR_LIBRARY_FILENAMES="/usr/share/glvnd/egl_vendor.d/50_mesa.json"

# export IGPU_RENDER=`readlink -f /dev/dri/by-path/pci-0000:00:02.0-render`
# export MOZ_WAYLAND_DRM_DEVICE="$IGPU_RENDER"
# export GDK_BACKEND="wayland"
# export MOZ_ENABLE_WAYLAND="1"
# export MOZ_WEBRENDER="1"
# export MOZ_DISABLE_RDD_SANDBOX="1"

# export SDL_VIDEODRIVER="wayland"
# export QT_QPA_PLATFORM="wayland"
# export XDG_SESSION_TYPE="wayland"

#export QT_XCB_GL_INTEGRATION="xcb_egl"
#export QT_WAYLAND_CLIENT_BUFFER_INTEGRATION="wayland-egl"
#export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
#export QTWEBENGINE_CHROMIUM_FLAGS=" --enable-oop-rasterization --enable-gpu-rasterization --enable-native-gpu-memory-buffers --use-gl=desktop"

#export LD_PRELOAD="libSDL2.so"

# export PROTON_ENABLE_NVAPI="0"
# export WINEDLLOVERRIDES="winemenubuilder.exe=d;nvapi64=d;nvapi=d;nvcuda=d;"

# export MOZ_DRM_DEVICE="$MOZ_WAYLAND_DRM_DEVICE"

# export XDG_CURRENT_DESKTOP="wlroots"
# export GTK_USE_PORTAL="0"

# export LIBVA_DRIVER_NAME="iHD"

# export XKB_DEFAULT_OPTIONS="ctrl:nocaps"
# export XCURSOR_THEME="Adwaita"

# export WLR_DRM_FORCE_LIBLIFTOFF="1"
# export WLR_SCENE_DEBUG_DAMAGE="0"

# export WINE_DISABLE_FULLSCREEN_HACK="1"
#export WINE_CPU_TOPOLOGY="4:0,1,2,3"

# export WINIT_UNIX_BACKEND="wayland"
# export WGPU_BACKEND="vulkan"

# export MESA_VK_WSI_PRESENT_MODE="immediate"

# export IGPU_CARD=`readlink -f /dev/dri/by-path/pci-0000:00:02.0-card`
# export WLR_DRM_DEVICES="$IGPU_CARD"

# export WLR_RENDERER="gles2"
# export WLR_RENDERER="vulkan"

# export LABWC_ADAPTIVE_SYNC="1"

# export ENABLE_GAMESCOPE_WSI="0"
# gamescope -w 2560 -h 1080 -W 2560 -H 1080 -f -S integer -- %command%

# for HZD on pascal
# VKD3D_CONFIG=dxr,dxr11,no_upload_hvv VK_INSTANCE_LAYERS=VK_LAYER_MESA_overlay DXVK_FILTER_DEVICE_NAME="GTX 1050" PROTON_ENABLE_NVAPI=0 %command%

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

export SSH_OPENOCD="pi3"
