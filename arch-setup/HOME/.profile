export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"

export DXVK_FILTER_DEVICE_NAME="UHD Graphics 630"
export DXVK_HUD="devinfo,fps,frametimes,gpuload,version,api"
export DXVK_CONFIG_FILE="$HOME/.config/dxvk.conf"

#export VK_INSTANCE_LAYERS="VK_LAYER_MESA_overlay"

#need 32bit path maybe
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:/usr/local/lib32/pkgconfig:$PKG_CONFIG_PATH"
export LD_LIBRARY_PATH="/usr/local/lib:/usr/local/lib32:$LD_LIBRARY_PATH"

export __EGL_VENDOR_LIBRARY_FILENAMES="/usr/share/glvnd/egl_vendor.d/50_mesa.json"

export IGPU_RENDER=`readlink -f /dev/dri/by-path/pci-0000:00:02.0-render`
export MOZ_WAYLAND_DRM_DEVICE="$IGPU_RENDER"
export GDK_BACKEND="wayland"
export MOZ_ENABLE_WAYLAND="1"
export MOZ_WEBRENDER="1"
export MOZ_DISABLE_RDD_SANDBOX="1"

export SDL_VIDEODRIVER="wayland"
export QT_QPA_PLATFORM="wayland"
export XDG_SESSION_TYPE="wayland"

#export QT_XCB_GL_INTEGRATION="xcb_egl"
#export QT_WAYLAND_CLIENT_BUFFER_INTEGRATION="wayland-egl"
#export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
#export QTWEBENGINE_CHROMIUM_FLAGS=" --enable-oop-rasterization --enable-gpu-rasterization --enable-native-gpu-memory-buffers --use-gl=desktop"

#export LD_PRELOAD="libSDL2.so"

#export GBM_BACKEND="nvidia-drm"
export PROTON_ENABLE_NVAPI="0"
export WINEDLLOVERRIDES="winemenubuilder.exe=d;nvapi64=d;nvapi=d"

export MOZ_DRM_DEVICE="$MOZ_WAYLAND_DRM_DEVICE"

export XDG_CURRENT_DESKTOP="wlroots"
export GTK_USE_PORTAL="0"

export LIBVA_DRIVER_NAME="iHD"

export XKB_DEFAULT_OPTIONS="ctrl:nocaps"
export XCURSOR_THEME="Adwaita"

export __GL_SHADER_DISK_CACHE_SKIP_CLEANUP="1"

export WLR_DRM_FORCE_LIBLIFTOFF="1"
export WLR_SCENE_DEBUG_DAMAGE="0"

export WINE_DISABLE_FULLSCREEN_HACK="1"
#export WINE_CPU_TOPOLOGY="4:0,1,2,3"

export WINIT_UNIX_BACKEND="wayland"
export WGPU_BACKEND="vulkan"

export MESA_VK_WSI_PRESENT_MODE="immediate"

export IGPU_CARD=`readlink -f /dev/dri/by-path/pci-0000:00:02.0-card`
export WLR_DRM_DEVICES="$IGPU_CARD"


#plasma build env
export PATH="$HOME/kde/usr/bin:$PATH"
export PKG_CONFIG_PATH="$HOME/kde/usr/lib/pkgconfig:$PKG_CONFIG_PATH"
export LD_LIBRARY_PATH="$HOME/kde/usr/lib:$LD_LIBRARY_PATH"

#export CMAKE_PREFIX_PATH="$HOME/kde/usr"
export QML2_IMPORT_PATH="$HOME/kde/usr/lib/qml:$QML2_IMPORT_PATH"
export QT_PLUGIN_PATH="$HOME/kde/usr/lib/plugins:$QT_PLUGIN_PATH"  

export XDG_DATA_DIRS="$HOME/kde/usr/share:/usr/local/share:/usr/share:$XDG_DATA_DIRES"
export XDG_CONFIG_DIRS="$HOME/kde/usr/etc/xdg:/etc/xdg"
