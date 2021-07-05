#!/bin/bash

set -x


./configure --prefix=$PREFIX --enable-shared-barvinok --disable-dependency-tracking

make -j${CPU_COUNT}

make install
