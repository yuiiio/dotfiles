 #!/usr/bin/env bash

# might need shutdown steam before unload nvidia.

#firefox like egl initialized application prevent unload nvidia module
#I use __EGL_VENDOR_LIBRARY_FILENAMES="/usr/share/glvnd/egl_vendor.d/50_mesa.json"

#sudo udevadm trigger --verbose --type=devices --action=remove --subsystem-match=drm --property-match="MINOR=1"

declare result

_unload_nvidia() {
    sudo rmmod nvidia_uvm
    sudo rmmod nvidia_drm
    sudo rmmod nvidia_modeset
    sudo rmmod nvidia
}

_load_nouveau() {
    sudo modprobe nouveau runpm=1 atomic=1
}

result=$( _unload_nvidia 2>&1 | grep -v "is not currently loaded" )

#Avoid loading both at the same time.
if [ "$result" = "" ]; then
    _load_nouveau
else
    echo $result
fi

unset -v result
