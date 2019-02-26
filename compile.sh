#!/usr/bin/env bash

source path.sh

if [ ! -d "$build_folder" ]; then
  mkdir $build_folder
fi
if [ ! -d "$temporary_folder" ]; then
  mkdir $temporary_folder
  created_tmp=1
fi

for arg in "$@"
do
    if [[ $arg == "c" ]]; then
        printf "    C file ... "
        gcc -o $build_folder/countC $src_folder/C/countC.c
        echo "done"

    elif [[ $arg == "java" ]]; then
        printf "    Java file ... "
        javac -d $build_folder $src_folder/Java/CountJava.java
        echo "done"

    elif [[ $arg == "assembly" ]]; then
        printf "    Assembly ... "
        nasm -fmacho64 $src_folder/Assembly/countAssembly.asm -o $temporary_folder/countAssembly.o
        gcc -o $build_folder/countAssembly $temporary_folder/countAssembly.o 2>/dev/null
        echo "done"

    elif [[ $arg == "python" ]]; then
        cp $src_folder/Python/countPython.py $build_folder/countPython.py

    elif [[ $arg == "bash" ]]; then
        cp $src_folder/Bash/countBash.sh $build_folder/countBash.sh
        chmod +x $build_folder/countBash.sh

    elif [[ $arg == "swift" ]]; then
        cp $src_folder/Swift/countSwift.swift $build_folder/countSwift.swift

    elif [[ $arg == "ruby" ]]; then
        cp $src_folder/Ruby/countRuby.rb $build_folder/countRuby.rb

    elif [[ $arg == "perl" ]]; then
        cp $src_folder/Perl/countPerl.pl $build_folder/countPerl.pl

    elif [ $arg == "javascript" ] || [ $arg == "js" ]; then
        cp $src_folder/Javascript/countJS.js $build_folder/countJS.js

    fi
done

if [[ $created_tmp == 1 ]]; then
    rm -R $temporary_folder
fi
