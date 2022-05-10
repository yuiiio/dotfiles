export PATH="$HOME/.local/bin:$PATH"
source "$HOME/.cargo/env"

export DXVK_FILTER_DEVICE_NAME="UHD Graphics 630"
export DXVK_HUD="devinfo,fps,frametimes,gpuload,version,api"
export DXVK_CONFIG_FILE="/home/haibane/.config/dxvk.conf"

export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
export LD_LIBRARY_PATH="/usr/local/lib"

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

#export XWAYLAND_NO_GLAMOR="1"
