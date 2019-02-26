#!/usr/bin/env bash

args="$@"
if [[ "$#" == 0 ]]; then
    #args="python c java assembly"
    args="c python assembly swift java js ruby perl bash"
fi

echo "  ** Compiling **  "
chmod +x compile.sh
./compile.sh $args

echo ""
echo ""
echo ""

echo "  ** Running **  "
chmod +x run.sh
./run.sh $args
