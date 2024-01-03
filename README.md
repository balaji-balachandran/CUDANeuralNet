# CUDANET

## About

Cuda Net is a project to implement a neural network from scratch exclusively in C++/CUDA, leveraging the power of GPU's. Support for 

## How to Run the Code 

### Setting up the development environment

**NVIDIA CUDA Toolkit is currently only available for Windows and Linux**




---
### On Windows
#### Execute the following commands from the top level directory:
Compile the code with:

```nvcc -o ./bin/output.exe -I./src/ ./src/driver.cu ./src/layers/layer.cu ./src/layers/fullyConnectedLayer.cu```

Then, run the code with 

``` ./bin/output.exe ```

Or simply compile and execute in one step with 

```nvcc -o ./bin/output.exe -I./src/ ./src/driver.cu ./src/layers/layer.cu ./src/layers/fullyConnectedLayer.cu ; ./bin/output.exe ```

(Note: In case of compilation error, if an *output.exe* file already exists, ***the previous output.exe file will (dubiously) be executed following the output of compilation errors when using the single step compile and run method***)

---