#pragma once 
#include "./../base-layer/layer.h"
#include <iostream>

class ReLU : public Layer { 
    public: 
        ReLU(unsigned int size) : Layer(size, size) { };
        void Forward();
        void Backward();

};