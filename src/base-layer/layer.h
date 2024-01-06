#pragma once

class Layer {
    public:
        Layer(unsigned int input_size, unsigned int output_size, bool is_parallelized) : 
            input_size_(input_size), output_size_(output_size), is_parallelized_(is_parallelized){}
        unsigned int GetInputSize() { return input_size_; }
        unsigned int GetOutputSize() { return output_size_; }
        bool GetParallelized() { return is_parallelized_; }

        // Calculates the forward propagation of each layer 
        virtual float* Forward() = 0;

        // Calculates the gradient vector and update weights accordingly
        virtual float* Backward() = 0;

    private:
        unsigned int input_size_;
        unsigned int output_size_;
        bool is_parallelized_;
}; 