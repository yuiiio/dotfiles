cd $HOME
rm -rf rpcs3_build
mkdir rpcs3_build
cd rpcs3_build
CC=/usr/bin/clang CXX=/usr/bin/clang++ cmake ../rpcs3/
make -j16
