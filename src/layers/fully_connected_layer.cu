#include "fully_connected_layer.h"

FullyConnectedLayer::FullyConnectedLayer(unsigned int input_size, unsigned output_size, bool is_parallelized):
    Layer(input_size, output_size, is_parallelized) {
        weights = new float[output_size_ * input_size_];
        biases = new float[output_size_];
    } 

float* FullyConnectedLayer::Forward(){
    std::cout << "Forward" << std::endl;
    return nullptr;
}

float* FullyConnectedLayer::Backward(){
    std::cout << "Backward" << std::endl;
    return nullptr;
}