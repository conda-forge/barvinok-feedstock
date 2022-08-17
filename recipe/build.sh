#!/bin/bash

set -ex

# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* .
cp $BUILD_PREFIX/share/gnuconfig/config.* polylib/
cp $BUILD_PREFIX/share/gnuconfig/config.* isl/

CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"

# Disable generating code for the build machine microarchitecture
export ax_cv_gcc_x86_cpuid_1=unknown

./configure --prefix=$PREFIX --enable-shared-barvinok --disable-dependency-tracking

make -j${CPU_COUNT}

if [[ "$CONDA_BUILD_CROSS_COMPILATION" != "1" || "$CROSSCOMPILING_EMULATOR" != "" ]]; then
    make check
fi

make install
