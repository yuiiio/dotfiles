# dxvk for wine-lol
ln -sf ~/dxvk-build/dxvk-master/x64/* ~/.wine-lol/drive_c/windows/system32/
ln -sf ~/dxvk-build/dxvk-master/x32/* ~/.wine-lol/drive_c/windows/syswow64/

# dxvk for proton exp
ln -sf ~/dxvk-build/dxvk-master/x64/* ~/.local/share/Steam/steamapps/common/Proton\ -\ Experimental/files/lib64/wine/dxvk/
ln -sf ~/dxvk-build/dxvk-master/x32/* ~/.local/share/Steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/dxvk/

# vkd3d for proton exp
ln -sf ~/vkd3d-proton-build/vkd3d-proton-master/x64/* ~/.local/share/Steam/steamapps/common/Proton\ -\ Experimental/files/lib64/wine/vkd3d-proton/
ln -sf ~/vkd3d-proton-build/vkd3d-proton-master/x86/* ~/.local/share/Steam/steamapps/common/Proton\ -\ Experimental/files/lib/wine/vkd3d-proton/
