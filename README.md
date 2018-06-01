# Matrix multiplication module
Four versions of matrix multiplication algorithm, each utilising different (or no) optimization technique.

## Compilation & running a performence test
```
cmake CMakeLists.txt
./MatrixMulitiplication START END STEP MODE
```
Running the code above will start the performance test for number of NxN matrixes, where N is specified by the START, END and STEP parameters (endpoint-inclusive). The MODE parameter specifies which version of the algorithm should be used (as described below). If MODE equals to anything other than 0, 1, 2 or 3 the library function is used instead.
This should work with both [gfortran](https://gcc.gnu.org/wiki/GFortran) or [ifort](https://software.intel.com/en-us/fortran-compilers) set as the defualt CMake Fortran compiler (preferably the former).<br />
The visualisation program depends on **numpy** and **matplotlib** Python packages. <br />
An example output could look like this (each line signifies accordingly N and time in seconds):
```
> ./MatrixMulitiplication 100 1100 200 2
     100    0.0018
     300    0.0431
     500    0.1885
     700    0.5131
     900    1.0930
    1100    1.9980

```

## Testing
Before running the tests make sure you have the pFunit framework installed and replace the PFUNIT variable in tests/makefile with path to the pFunit installation directiory on your machine, if necessary.

To run the tests type:
```
cd tests
make test
./test
```

## Versions of the algorithm
* **mm0** - no optimization
* **mm1** - use library dot_product function for calculating each of the result matrix elements
* **mm2** - [loop nest optimization](https://en.wikipedia.org/wiki/Loop_nest_optimization)
* **mm3** - both of the above

## Results
For N ∈ {100, 2500} with step of 100, with -02 compilation flag.<br />
![all](https://github.com/kasprzyckit/matrix-multiplication-fort/blob/master/results/mm_all.png)
<br />
On the image above:
* blue - **mm0**, ranging within [0.002s, 174.393s]
* green - **mm1**, ranging within [0.002s, 203.702s]
* red - **mm2**, ranging within [0.002s, 29.036s]
* cyan - **mm3**, ranging within [0.002s, 160.675s]
* magenta - library function, ranging within [0.002s, 56.89s]
