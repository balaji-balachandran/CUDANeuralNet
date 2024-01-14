#include "fully_connected_layer.h"

// TODO: Initialize weights randomly
FullyConnectedLayer::FullyConnectedLayer(unsigned int input_size, unsigned output_size, bool is_parallelized):
    Layer(input_size, output_size, is_parallelized) {
        weights_ = new float[input_size_ * output_size_];
        biases_ = new float[output_size_];

        std::random_device rd;
        std::mt19937 gen(rd()); // Mersenne Twister engine
    
        // Define a distribution for floating-point numbers between -0.5 and 0.5
        std::uniform_real_distribution<> distribution(-0.5, 0.5);

        // Random generation of weights and biases
        for(int j = 0; j < output_size_; j++){
            for(int i = 0; i < input_size_; i++){
                weights_[i * output_size_ + j] = distribution(gen);
            }
            biases_[j] = distribution(gen);
        }

    } 

float* FullyConnectedLayer::Forward(float* input_data){
    input_ = input_data;
    float* layer_output = is_parallelized_ ? ParallelizedForward(input_data) : 
                                             SequentialForward(input_data);

    return layer_output;
}

float* FullyConnectedLayer::SequentialForward(float* input_data){
    float* layer_output = new float[output_size_];
    
    for(size_t i = 0; i < output_size_; i++){
        float sum = 0;
        for(size_t j = 0; j < input_size_; j++){
            sum += input_data[j] * GetWeight(j, i); 
        }
        layer_output[i] = sum + biases_[i];
    }

    return layer_output;
}

float* FullyConnectedLayer::ParallelizedForward(float* input_data){
    float* layer_output = new float[output_size_];
    // TODO: Implement this function

    return layer_output;
}

// TODO: Fix the weighted sum
float FullyConnectedLayer::GetWeight(size_t i, size_t j){
    if(i < input_size_ && j < output_size_){
        return weights_[i * output_size_ + j];
    }
    std::cerr << "Invalid Access of weight in weight matrix (" << i << ", " << j << "), matrix is of size (" << input_size_ << ", " << output_size_ << ")";
    throw std::runtime_error("Invalid Access of weight in weight matrix");
}

float* FullyConnectedLayer::Backward(float* d_error_d_output){
    float* d_error_d_input = is_parallelized_ ? ParallelizedBackward(d_error_d_output) : 
    SequentialBackward(d_error_d_output);
    
    return d_error_d_input;
}

float* FullyConnectedLayer::SequentialBackward(float* d_error_d_output){
    // This is the error due to this layer (computed through chain rule)
    float* d_error_d_input = new float[input_size_];
    
    // Updates the biases
    for(size_t i = 0; i < output_size_; i++){
        biases_[i] -= d_error_d_output[i];
    }

    // Calculates the error due to the layer (necessary for previous layer)
    for(size_t i = 0; i < input_size_; i++){
        float sum = 0;
        for(size_t j = 0; j < output_size_; j++){
            sum += d_error_d_output[j] * GetWeight(i,j);
        }
        d_error_d_input[i] = sum;
    }

    // Calculates change to weights and updates them (MUST COME AFTER calculating gradient error due to layer)
    for(size_t i = 0; i < input_size_; i++){
        for(size_t j = 0; j < output_size_; j++){
            weights_[i * output_size_ + j] -= d_error_d_output[j] * input_[i];
        }
    }

    return d_error_d_input;
}

float* FullyConnectedLayer::ParallelizedBackward(float* d_error_d_output){
    return nullptr;
}

FullyConnectedLayer::~FullyConnectedLayer(){
    delete[] weights_;
    delete[] biases_;
}