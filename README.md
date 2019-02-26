# Programming Languages Benchmark
A benchmark to evaluate the performances of different programming languages.

## Important notes
 * This benchmark has no scientific value
 * The benchmark has to be launched on Mac x86 64bits machine to be able to compile the assembly code
 * To run the javascript code, ```node``` has to be installed

## Presentation
This benchmark launches the same code on different programming languages mesuring the execution time for each of them. It then displays the execution time for each programming language.

## Current tests
### The for loop test
The program lanches a for loop to count from 0 to 10^8 one by one

*note:* given the fact that the bash for loops and while loops are far too slow, the bash script counts using ```jot```. Please, refer to the first *important note*.

## How it works
First, the benchmark compile the codes that require compiling. Those who doesn't are just copied into the ```build``` folder.
Then it lanches one by one each script/executable.

## Usage
The main script is ```benchmark.sh```:
```bash
./benchmark.sh [options] [arguments]
```

The possible **options** are:
 * ```-h``` or ```--help```: Displays all the currently supported options
 * ```-i``` or ```--info```: Displays informations about the benchmark and the currently installed supported programming languages
 * ```-r``` or ```--run```: Run the benchmark. As argument, the programming languages to be tested can be given
 * ```-t``` or ```--todo```: Displays the onn work features still to be added
 * ```-v``` or ```--version```: Displays the current version number

The run **arguments**:
If only some programming languages are to be tested, these can be specified as argument. For instance, you can run the following:
```bash
./benchmark.sh -r java c python js
```


*note:* the ```benchmark.sh``` file has to be executable to be ran. If it isn't, please lanch the following command:
```bash
chmod +x benchmark.sh
```
