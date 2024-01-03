#pragma once 
#include "activationFunction.h"
#include <iostream>

class ReLU : public ActivationFunction { 
    public: 
        ReLU() : ActivationFunction() { };
        void Forward();
        void Backward();

};