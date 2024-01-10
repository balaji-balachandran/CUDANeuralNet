#pragma once 

class LossFunction { 
    public: 
        LossFunction(unsigned int num_classes) : num_classes_(num_classes) {};
        virtual float GetLoss(float* y_true, float* y_predicted) = 0;
        virtual float GetLoss(float* y_predicted, int index) = 0;
        virtual float* GetGradient(float* y_true, float* y_predicted) = 0; 
        virtual float* GetGradient(float* y_predicted, int index) = 0; 
        
    protected:
        unsigned int num_classes_;
};