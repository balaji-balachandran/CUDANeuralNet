#pragma once 
#include "./../base-layer/layer.h"
#include <iostream>
#include <random>

class FullyConnectedLayer : public Layer { 
    public: 
        FullyConnectedLayer(unsigned int input_size, unsigned int output_size, bool is_parallelized);
        float* Forward(float* input_data);
        float* SequentialForward(float* input_data);
        float* ParallelizedForward(float* input_data);

        float* Backward(float* d_error_d_output);        
        float* SequentialBackward(float* d_error_d_output);   
        float* ParallelizedBackward(float* d_error_d_output);

        float  GetWeight(size_t i, size_t j);
    
    private:
        // n x m matrix where n = input_size and m = output_size 
        float* weights_;

        // m x 1 matrx where m = output_size
        float* biases_;

};