#pragma once

class Layer {
    public:
        Layer(unsigned int inputSize, unsigned int outputSize) : _inputSize(inputSize), _outputSize(outputSize){}
        unsigned int getInputSize() { return _inputSize; };
        unsigned int getOutputSize() { return _outputSize; };

        virtual void Forward() = 0;
        virtual void Backward() = 0;
    private:
        unsigned int _inputSize;
        unsigned int _outputSize;
};