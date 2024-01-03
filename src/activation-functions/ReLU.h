#pragma once 
#include "./../base-layer/layer.h"
#include <iostream>

class ReLU : public Layer { 
    public: 
        ReLU(unsigned int inputSize, unsigned int outputSize) : Layer(inputSize, outputSize) { };
        void Forward();
        void Backward();

};