 #!/usr/bin/env bash

# need load nvidia before launch steam

#sudo udevadm trigger --verbose --type=devices --action=remove --subsystem-match=drm --property-match="MINOR=1"

declare result

_unload_nouveau() {
    sudo rmmod nouveau
}

_load_nvidia() {
    sudo modprobe nvidia
    sudo modprobe nvidia_drm modeset=1
    sudo modprobe nvidia_modeset
    sudo modprobe nvidia_uvm

    #need ?
    sudo nvidia-modprobe -u -c=0
}

result=$( _unload_nouveau 2>&1 | grep -v "is not currently loaded" )

#Avoid loading both at the same time.
if [ "$result" = "" ]; then
    _load_nvidia
else
    echo $result
fi

unset -v result
