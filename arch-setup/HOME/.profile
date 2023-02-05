export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"

export DXVK_FILTER_DEVICE_NAME="UHD Graphics 630"
export DXVK_HUD="devinfo,fps,frametimes,gpuload,version,api"
export DXVK_CONFIG_FILE="$HOME/.config/dxvk.conf"

#need 32bit path maybe
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH"
export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"

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

export WINIT_UNIX_BACKEND="wayland"
