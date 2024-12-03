# for mingw & ccache

export MINGW_GCC_VERSION=`/usr/bin/x86_64-w64-mingw32-gcc --version | grep gcc | awk '{print $3}'`

sudo ln -sf /usr/bin/ccache  /usr/lib/ccache/bin/x86_64-w64-mingw32-c++
sudo ln -sf /usr/bin/ccache  /usr/lib/ccache/bin/x86_64-w64-mingw32-cc
sudo ln -sf /usr/bin/ccache  /usr/lib/ccache/bin/x86_64-w64-mingw32-cpp
sudo ln -sf /usr/bin/ccache  /usr/lib/ccache/bin/x86_64-w64-mingw32-g++
sudo ln -sf /usr/bin/ccache  /usr/lib/ccache/bin/x86_64-w64-mingw32-gcc
sudo ln -sf /usr/bin/ccache  /usr/lib/ccache/bin/x86_64-w64-mingw32-gcc-$MINGW_GCC_VERSION

sudo ln -sf /usr/bin/ccache  /usr/lib/ccache/bin/i686-w64-mingw32-c++
sudo ln -sf /usr/bin/ccache  /usr/lib/ccache/bin/i686-w64-mingw32-cc
sudo ln -sf /usr/bin/ccache  /usr/lib/ccache/bin/i686-w64-mingw32-cpp
sudo ln -sf /usr/bin/ccache  /usr/lib/ccache/bin/i686-w64-mingw32-g++
sudo ln -sf /usr/bin/ccache  /usr/lib/ccache/bin/i686-w64-mingw32-gcc
sudo ln -sf /usr/bin/ccache  /usr/lib/ccache/bin/i686-w64-mingw32-gcc-$MINGW_GCC_VERSION
