#pragma once 
#include "./../base-layer/layer.h"
#include <iostream>

class FullyConnectedLayer : public Layer { 
    public: 
        FullyConnectedLayer(unsigned int inputSize, unsigned int outputSize, bool is_parallelized);
        void Forward();
        void Backward();
    
    private:
        float* weights_;
        float* biases_;

};