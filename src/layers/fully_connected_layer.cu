#include "fully_connected_layer.h"

FullyConnectedLayer::FullyConnectedLayer(unsigned int input_size, unsigned output_size, bool is_parallelized):
    Layer(input_size, output_size, is_parallelized) {
        
    } 

void FullyConnectedLayer::Forward(){
    std::cout << "Forward" << std::endl;
}

void FullyConnectedLayer::Backward(){
    std::cout << "Backward" << std::endl;
}