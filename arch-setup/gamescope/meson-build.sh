meson build -Denable_openvr_support=false -Dforce_fallback_for=stb -Dpipewire=enabled

sudo meson install -C build/ --skip-subprojects
