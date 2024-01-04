#pragma once

class Layer {
    public:
        Layer(unsigned int inputSize, unsigned int outputSize) : _inputSize(inputSize), _outputSize(outputSize){}
        unsigned int GetInputSize() { return _inputSize; };
        unsigned int GetOutputSize() { return _outputSize; };

        virtual void Forward() = 0;
        virtual void Backward() = 0;
    private:
        unsigned int _inputSize;
        unsigned int _outputSize;
};