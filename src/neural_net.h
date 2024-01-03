#pragma once
#include "./base-layer/layer.h"
#include <vector>

class NeuralNet {
    public:
        NeuralNet() = default;
        NeuralNet(std::vector<Layer*> layers);
        void addLayer(Layer* layer);
        void forwardPropogation();
        void backwardPropogation();

    private:
        std::vector<Layer*> layers_;
        unsigned int input_size_;
        unsigned int output_size_;
};