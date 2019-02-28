#!/usr/bin/env bash

NAME="Benchmark"
VERSION="1.3.1"

error_no_arguments() {
    echo "Benchmark needs at leasts one argument."
    echo -e "\t Check \"benchmark -h\" for help."
}

error_unrecognised_argument(){
    echo "Unrecognised option \"$1\""
    echo -e "\t Check \"benchmark -h\" for help."
}

if [[ "$#" -eq 0 ]]; then
    error_no_arguments

elif [ "$1" == "-h" ] || [ "$1" == "--help" ] ; then
    echo "Compiles and lunch the same test in differents programming languages then displays rhe execution time for each of them.
    The currently supported programming languages are: python c java assembly and others (javascript require node)."
    echo ""
    echo "Usage:"
    echo -e "\t benchmark [options] [arguments]"
    echo ""
    echo -e "\t -h, --help \t Displays help message"
    echo -e "\t -i, --info \t Displays informations about the benchmark"
    echo -e "\t -r, --run \t Run the benchmark"
    echo -e "\t\t optional arguments: one or more programming language to benchmark"
    echo -e "\t\t example: benchmark -r python c java"
    echo -e "\t -rs, --run-short \t Same as \"-r\" option but only displays a short output"
    echo -e "\t -t, --todo \t Displays the next planned updates"
    echo -e "\t -v, --version \t Displays the current version number"

elif [ "$1" == "-i" ] || [ "$1" == "--info" ]; then
    echo "The benchmark executes the following codes:"
    echo "  * Count from 0 to 10^8"
    echo ""
    echo "It supports the following programming languages:"
    echo -e "  * Python \t : \t" $(python3 --version)
    echo -e "  * Java \t : \t" $(java --version)
    echo -e "  * C"
    echo -e "  * Bash \t : \t" $(bash --version | grep version)
    echo -e "  * Assembly \t : \t macOS Intel x86 nasm"
    echo -e "  * Swift \t : \t" $(swift --version)
    echo -e "  * Javascript \t : \t" $(node -v)
    echo -e "  * Ruby \t : \t" $(ruby -v)
    echo -e "  * Perl \t : \t" $(perl -v | grep version)

elif [ "$1" == "-r" ] || [ "$1" == "--run" ]; then
    echo -e ""
    echo -e "\t        _____"
    echo -e "\t     _.'_____\`._"
    echo -e "\t   .'.-'  12 \`-.\`."
    echo -e "\t  /,' 11      1 \`.\\"
    echo -e "\t // 10      /   2 \\\\"
    echo -e "\t;;         /       ::"
    echo -e "\t|| 9  ----O      3 ||"
    echo -e "\t::                 ;;"
    echo -e "\t \\\\ 8           4 //"
    echo -e "\t  \\\`. 7       5 ,'/"
    echo -e "\t   '.\`-.__6__.-'.'"
    echo -e "\t    ((-._____.-))"
    echo -e "\t    _))       ((_"
    echo -e "\t   '--'       '--'"
    echo -e ""
    chmod +x init.sh
    ./init.sh "${@:2}"

elif [ "$1" == "-rs" ] || [ "$1" == "--run-short" ]; then
    chmod +x init.sh
    ./init.sh 1 ${@:2}

elif [ "$1" == "-t" ] || [ "$1" == "--todo" ]; then
    echo "  * Add more tests"
    echo "  * Add more programming languages"

elif [ "$1" == "-v" ] || [ "$1" == "--version" ]; then
    echo $NAME" v"$VERSION

else
    error_unrecognised_argument $1
fi

echo ""
