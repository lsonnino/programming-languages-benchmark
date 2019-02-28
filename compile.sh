#!/usr/bin/env bash

source path.sh

if [ ! -d "$build_folder" ]; then
  mkdir $build_folder
fi
if [ ! -d "$temporary_folder" ]; then
  mkdir $temporary_folder
  created_tmp=1
fi

if [[ $1 == 1 ]]; then
    short=1
else
    short=0
fi

compile(){
    if [[ $short == 0 ]]; then
        echo -ne "\t compiling $1 files ... "
    fi

    $(${@:2})

    if [[ $short == 0 ]]; then
        echo "done"
    fi
}

prepare(){
    if [[ $short == 0 ]]; then
        echo -ne "\t preparing $1 files ... "
    fi

    $(${@:2})

    if [[ $short == 0 ]]; then
        echo "done"
    fi
}

for arg in "${@:2}"
do
    if [[ $arg == "c" ]]; then
        compile C gcc -o $build_folder/countC $src_folder/C/countC.c

    elif [[ $arg == "java" ]]; then
        compile java javac -d $build_folder $src_folder/Java/CountJava.java

    elif [[ $arg == "assembly" ]]; then
        compile assembly nasm -fmacho64 $src_folder/Assembly/countAssembly.asm -o $temporary_folder/countAssembly.o && gcc -o $build_folder/countAssembly $temporary_folder/countAssembly.o 2>/dev/null

    elif [[ $arg == "python" ]]; then
        prepare python cp $src_folder/Python/countPython.py $build_folder/countPython.py

    elif [[ $arg == "bash" ]]; then
        prepare bash cp $src_folder/Bash/countBash.sh $build_folder/countBash.sh && chmod +x $build_folder/countBash.sh

    elif [[ $arg == "swift" ]]; then
        prepare swift cp $src_folder/Swift/countSwift.swift $build_folder/countSwift.swift

    elif [[ $arg == "ruby" ]]; then
        prepare ruby cp $src_folder/Ruby/countRuby.rb $build_folder/countRuby.rb

    elif [[ $arg == "perl" ]]; then
        prepare perl cp $src_folder/Perl/countPerl.pl $build_folder/countPerl.pl

    elif [ $arg == "javascript" ] || [ $arg == "js" ]; then
        prepare javascript cp $src_folder/Javascript/countJS.js $build_folder/countJS.js

    fi
done

if [[ $created_tmp == 1 ]]; then
    rm -R $temporary_folder
fi
