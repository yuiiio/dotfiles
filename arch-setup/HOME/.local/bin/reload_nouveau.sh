 #!/usr/bin/env bash

 #sudo udevadm trigger --verbose --type=devices --action=remove --subsystem-match=drm --property-match="MINOR=1"

 declare result

 _reload_nouveau() {
     sudo rmmod nouveau
     sudo modprobe nouveau runpm=1 atomic=1
}

result=$(lsmod | grep nvidia)

#Avoid loading both at the same time.
if [ "$result" = "" ]; then
    _reload_nouveau
else
    echo "currently loaded nvidia"
fi

unset -v result
