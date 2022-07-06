#!/bin/bash

set -ex

./configure --prefix=$PREFIX --enable-shared-barvinok --disable-dependency-tracking

make -j${CPU_COUNT}

if [[ "$CONDA_BUILD_CROSS_COMPILATION" != "1" ]]; then
    make check
fi

make install
