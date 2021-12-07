#!/usr/bin/env bash
#
# run ghc and delete object and interface files
NAME=$(basename $1 .hs)
ghc $1
rm $NAME.o $NAME.hi
