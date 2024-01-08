#include "softmax.h"

float* Softmax::Forward(float* input_data){
    input_ = input_data;
    float* layer_output = is_parallelized_ ? ParallelizedForward(input_data) : 
                                             SequentialForward(input_data);

    return layer_output;
}

float* Softmax::SequentialForward(float* input_data){
    float* layer_output = new float[output_size_];
    float normalizer = 0;
    for(size_t i = 0; i < input_size_; i++){
        normalizer += std::exp(input_data[i]);
    }

    for(size_t i = 0; i < input_size_; i++){
        layer_output[i] = std::exp(input_data[i]) / normalizer;
    }
    
    return layer_output;
}

float* Softmax::ParallelizedForward(float* input_data){
    return nullptr;
}

float* Softmax::Backward(float* d_error_d_output){
    float* d_error_d_input = is_parallelized_ ? ParallelizedBackward(d_error_d_output) : 
        SequentialBackward(d_error_d_output);
    
    return d_error_d_input;
}

float* Softmax::SequentialBackward(float* d_error_d_output){
    float* d_error_d_input = new float[input_size_];
    
    float normalizer = 0;
    for(size_t i = 0; i < input_size_; i++){
        normalizer += std::exp(input_[i]);
    }

    for(size_t i = 0; i < input_size_; i++){
        float softmax_input = std::exp(input_[i]) / normalizer;
        d_error_d_input[i] = d_error_d_output[i] * softmax_input * (1 - softmax_input);
    }

    return d_error_d_input;
}

float* Softmax::ParallelizedBackward(float* d_error_d_output){
    return nullptr;
}