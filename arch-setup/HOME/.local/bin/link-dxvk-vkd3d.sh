# dxvk for proton exp
ln -sf ~/dxvk-build/dxvk-master/x64/* ~/.local/share/Steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/dxvk/x86_64-windows/
ln -sf ~/dxvk-build/dxvk-master/x32/* ~/.local/share/Steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/dxvk/i386-windows/


# vkd3d for proton exp
ln -sf ~/vkd3d-proton-build/vkd3d-proton-master/x64/* ~/.local/share/Steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/vkd3d-proton/x86_64-windows
ln -sf ~/vkd3d-proton-build/vkd3d-proton-master/x86/* ~/.local/share/Steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/vkd3d-proton/i386-windows/

# for local build
ln -sf ~/dxvk-build/dxvk-master/x64/* ~/.local/share/Steam/compatibilitytools.d/*/files/lib/wine/dxvk/x86_64-windows/
ln -sf ~/dxvk-build/dxvk-master/x32/* ~/.local/share/Steam/compatibilitytools.d/*/files/lib/wine/dxvk/i386-windows/

ln -sf ~/vkd3d-proton-build/vkd3d-proton-master/x64/* ~/.local/share/Steam/compatibilitytools.d/*/files/lib/wine/vkd3d-proton/x86_64-windows/
ln -sf ~/vkd3d-proton-build/vkd3d-proton-master/x86/* ~/.local/share/Steam/compatibilitytools.d/*/files/lib/wine/vkd3d-proton/i386-windows/
