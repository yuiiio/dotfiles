cd /home/haibane/.proton-egs

DXVK_HUD=0 ENABLE_LAYER_MESA_ANTI_LAG=1 LD_LIBRARY_PATH=$HOME/.local/share/Steam/ubuntu12_32:$HOME/.local/share/Steam/ubuntu12_64:$LD_LIBRARY_PATH WINEDLLOVERRIDES="dxgi=n,b;$WINEDLLOVERRIDES" VK_INSTANCE_LAYERS=VK_LAYER_MESA_overlay STEAM_COMPAT_DATA_PATH=/home/haibane/.proton-egs STEAM_COMPAT_CLIENT_INSTALL_PATH=/home/haibane/.local/share/Steam /home/haibane/.local/share/Steam/compatibilitytools.d/proton-EM-mod/proton run /home/haibane/.proton-egs/pfx/drive_c/Program\ Files\ \(x86\)/Epic\ Games/Launcher/Portal/Binaries/Win32/EpicGamesLauncher.exe

# -opengl -SkipBuildPatchPrereq

# copy gstreamer-1.0/* and lib* from Prootn-GE
# cp ../../../../../GE-Proton10-26/files/lib/i386-linux-gnu/gstreamer-1.0/* ./
# cp ../../../../../GE-Proton10-26/files/lib/x86_64-linux-gnu/gstreamer-1.0/* ./
# cp ../../../../GE-Proton10-26/files/lib/i386-linux-gnu/* ./
# cp ../../../../GE-Proton10-26/files/lib/x86_64-linux-gnu/* ./
