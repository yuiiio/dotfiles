 #!/usr/bin/env bash

 declare result

 _reload_nouveau() {
     sudo rmmod nouveau
     sudo modprobe nouveau
}

result=$(lsmod | grep nvidia)

#Avoid loading both at the same time.
if [ "$result" = "" ]; then
    _reload_nouveau
else
    echo "currently loaded nvidia"
fi

unset -v result
