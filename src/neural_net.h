#pragma once
#include "./base-layer/layer.h"
#include "./exceptions/layer_exception.h"
#include "./loss-functions/loss_function.h"
#include <sstream>
#include <vector>

class NeuralNet {
    public:
        NeuralNet(unsigned int input_size, unsigned int output_size);
        NeuralNet(unsigned int input_size, unsigned int output_size, std::vector<Layer*> layers);
        void AddLayer(Layer* layer);
        void SetLossFunction(LossFunction* loss_function);
        float* ForwardPropogation(float* x);
        float* GetLossGradient(float* y_predicted, int true_value);
        void BackwardPropogation(float* error);
        

    private:
        std::vector<Layer*> layers_;
        LossFunction* loss_function_;
        unsigned int input_size_;
        unsigned int output_size_;
};