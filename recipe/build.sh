#!/bin/bash

set -x

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .
cp $BUILD_PREFIX/share/gnuconfig/config.* polylib/
cp $BUILD_PREFIX/share/gnuconfig/config.* isl/

./configure --prefix=$PREFIX --enable-shared-barvinok --disable-dependency-tracking --with-isl=system

make -j${CPU_COUNT}

if [[ "$CONDA_BUILD_CROSS_COMPILATION" != "1" ]]; then
    make check
fi

make install
