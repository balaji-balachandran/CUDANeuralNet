#pragma once 
#include "layer.h"
#include <iostream>

class FullyConnectedLayer : public Layer { 
    public: 
        FullyConnectedLayer(unsigned int inputSize, unsigned int outputSize) : Layer(inputSize, outputSize) {} 
        void Forward();
        void Backward();

};