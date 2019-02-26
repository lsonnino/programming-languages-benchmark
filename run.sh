#!/usr/bin/env bash

source path.sh
source loading.sh

get_score(){
    local var=$1
    local first=$(echo $var | cut -b 1)
    var=$(echo $var | cut -b 3-7)

    if [[ $fist != "0" ]]; then
        local s=$(echo $var | cut -b 1)
        s=$(($s+60*$first))
        s=$(echo $s$(echo $var | cut -b 2-5))
    fi

    echo $s
}

run_test(){
    echo -ne " > "$1" \t : \t "

    echo -ne "..."
    var=$( { time ${@:2}; } 2>&1 | grep real | awk  '{print $2}')
    echo -ne "\b\b\b"
    echo $(get_score $var)
}

echo "Execution time [sec]"
for arg in "$@"
do

    if [[ $arg == "c" ]]; then
        run_test $arg $build_folder/./countC

    elif [[ $arg == "python" ]]; then
            run_test $arg python3 $build_folder/countPython.py

    elif [[ $arg == "java" ]]; then
        cd $build_folder
        run_test $arg java CountJava
        cd ..

    elif [[ $arg == "assembly" ]]; then
        run_test $arg $build_folder/./countAssembly

    elif [[ $arg == "bash" ]]; then
        run_test $arg $build_folder/./countBash.sh

    elif [[ $arg == "swift" ]]; then
        run_test $arg swift run $build_folder/countSwift.swift 2>/dev/null

    elif [[ $arg == "ruby" ]]; then
        run_test $arg ruby $build_folder/countRuby.rb

    elif [[ $arg == "perl" ]]; then
        run_test $arg perl $build_folder/countPerl.pl

    elif [ $arg == "javascript" ] || [ $arg == "js" ]; then
        run_test javascript node $build_folder/countJS.js

    else
        echo " > Language " $arg " not supported yet. Passed."
    fi
done
