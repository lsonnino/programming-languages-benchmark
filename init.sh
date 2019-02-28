#!/usr/bin/env bash
if [[ "$1" == "1" ]]; then
    short=1
else
    short=0
fi

args="${@:2}"

if [[ $args == "" ]]; then
    args="c assembly java python swift js ruby perl bash"
fi

if [[ $short == 0 ]]; then
    echo "  ** Preparing **  "
fi
chmod +x compile.sh
./compile.sh $short $args

if [[ $short == 0 ]]; then
    echo ""
    echo ""
    echo ""

    echo "  ** Running **  "
fi

chmod +x run.sh
./run.sh $short $args
