# CUDANET

# A

## Run the Code with 
Compile the code with:

```nvcc -o ./bin/output.exe -I./src/ ./src/driver.cu ./src/layers/layer.cu ./src/layers/fullyConnectedLayer.cu```

Then, run the code simply with 

``` ./bin/output.exe ```

Or, compile and run 

```nvcc -o ./bin/output.exe -I./src/ ./src/driver.cu ./src/layers/layer.cu ./src/layers/fullyConnectedLayer.cu ; ./bin/output.exe ```
