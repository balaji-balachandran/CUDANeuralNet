#include "ReLU.h"

float* ReLU::Forward(float* input_data){
    input_ = input_data;
    float* layer_output = is_parallelized_ ? ParallelizedForward(input_data) : 
                                             SequentialForward(input_data);

    return layer_output;
}



float* ReLU::SequentialForward(float* input_data){
    float* layer_output = new float[output_size_];
    for(size_t i = 0; i < input_size_; i++){
        layer_output[i] = input_data[i] > 0 ? input_data[i] : 0;
    }
    
    return layer_output;
}

float* ReLU::ParallelizedForward(float* input_data){
    return nullptr;
}

float* ReLU::Backward(float* d_error_d_output){
    float* d_error_d_input = is_parallelized_ ? ParallelizedBackward(d_error_d_output) : 
        SequentialBackward(d_error_d_output);
    
    return d_error_d_input;
}

float* ReLU::SequentialBackward(float* d_error_d_output){
    float* d_error_d_input = new float[input_size_];
    for(size_t i = 0; i < input_size_; i++){
        d_error_d_input[i] = input_[i] > 0 ? d_error_d_output : 0;
    }
    return d_error_d_input;
}

float* ReLU::ParallelizedBackward(float* d_error_d_output){
    return nullptr;
}