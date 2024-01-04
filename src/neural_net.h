#pragma once
#include "./base-layer/layer.h"
#include "./exceptions/layer_exception.h"
#include <sstream>
#include <vector>

class NeuralNet {
    public:
        NeuralNet(unsigned int input_size, unsigned int output_size);
        NeuralNet(std::vector<Layer*> layers);
        void AddLayer(Layer* layer);
        void ForwardPropogation();
        void BackwardPropogation();

    private:
        std::vector<Layer*> layers_;
        unsigned int input_size_;
        unsigned int output_size_;
};