 #!/usr/bin/env bash

declare result

_check_dgpu_power_state() {
    cat /sys/bus/pci/devices/0000:01:00.0/power_state
}

result=$( _check_dgpu_power_state )

if [ "$result" = "D3cold" ]; then
    exit 0
else
    exit 1
fi

unset -v result
