#pragma once

class Layer {
    public:
        Layer(unsigned int input_size, unsigned int output_size, bool is_parallelized) : 
            input_size_(input_size), output_size_(output_size), is_parallelized_(is_parallelized){}
        unsigned int GetInputSize() { return input_size_; }
        unsigned int GetOutputSize() { return output_size_; }
        bool GetParallelized() { return is_parallelized_; }

        virtual void Forward() = 0;
        virtual void Backward() = 0;
    private:
        unsigned int input_size_;
        unsigned int output_size_;
        bool is_parallelized_;
};