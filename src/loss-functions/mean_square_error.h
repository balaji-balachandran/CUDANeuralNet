#pragma once
#include "loss_function.h"

class MeanSquaredError : public LossFunction { 
    public: 
        MeanSquaredError(unsigned int num_classes) : LossFunction(num_classes) {};
        float GetLoss(float* y_true, float* y_predicted);
        float* GetGradient(float* y_true, float* y_predicted); 
    
};