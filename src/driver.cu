#include <iostream>
#include "./layers/fully_connected_layer.h"
#include "./exceptions/layer_exception.h"
#include <sstream>

int main(){

    float* input_data = new float[3];
    for(int i = 0; i < 3; i++){
        input_data[i] = 0.1;
    }

    FullyConnectedLayer first =    FullyConnectedLayer(3, 4, false);

    float* output = first.Forward(input_data);
    for(int i = 0; i < first.GetOutputSize(); i++){
        std::cout << output[i] << std::endl;
    }

    // [3, 6, 9, 12]
    float* d_error = new float[4];
    for(int i = 0; i < 4; i++){
        d_error[i] = 3 * (i + 1);
    }

    float* d_error_input = first.Backward(d_error);
    for(int i = 0; i < 3; i++){
        std::cout <<  d_error_input[i] << std::endl;
    }
    

}