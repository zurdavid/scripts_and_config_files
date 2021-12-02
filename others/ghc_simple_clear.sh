NAME=$(basename $1 .hs)
ghc $1
rm $NAME.o $NAME.hi
