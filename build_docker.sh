#!bin/bash

PATH_NAME=$(pwd)
echo "PATH : ${PATH_NAME}"

git clone https://github.com/LIMDANBI/Cmake.git
cd Cmake
mkdir build
cd build
cmake ..
make
./program