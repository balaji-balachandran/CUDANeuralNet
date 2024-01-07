#pragma once 
#include "./../base-layer/layer.h"
#include <iostream>

class ReLU : public Layer { 
    public: 
        ReLU(unsigned int size) : Layer(size, size) { };
        float* Forward(float* input_data);
        float* SequentialForward(float* input_data);
        float* ParallelizedForward(float* input_data);

        float* Backward(float* d_error_d_output);
        float* SequentialBackward(float* d_error_d_output);
        float* ParallelizedBackward(float* d_error_d_output);
        
};