#!/bin/bash

set -x


./configure --prefix=$PREFIX --enable-shared-barvinok --with-isl=system

make -j${CPU_COUNT}

make check

make install
