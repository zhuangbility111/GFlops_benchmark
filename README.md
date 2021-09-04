# GFlops_benchmark

## Synopsis
GFlops_benchmark is a benchmark to measure the fp32 peak performance on **aarch64**. (supports NEON and SVE instructions)

## Installation
`git clone https://github.com/zhuangbility111/GFlops_benchmark`

## Dependency
In this project, `OpenMP` is uesd. So you should make sure there is an `OpenMP` library on your hardware.

## Compile
Default compiler: gcc

If you want to use another compiler, just modify the `CC` on `Makefile`.

1. `make` or `make NEON=TRUE` to compile NEON kernel
2. `make NEON=FALSE SVE=TRUE` to compile SVE kernel
3. `make SVE=TRUE` or `make NEON=TRUE SVE=TRUE` to compile both NEON and SVE kernel.

## Run

`./main`