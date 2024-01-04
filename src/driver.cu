#include <iostream>
#include "./layers/fully_connected_layer.h"
#include "./exceptions/layer_exception.h"
#include <sstream>

int main(){
    FullyConnectedLayer first = FullyConnectedLayer(60, 200);

    std::stringstream ss;
    ss << "Mismatched dimensions at Layer " << 12 
        << " (Actual Input Size was " << 150 
        << ", expected " << 200 << ")";
    
    std::cout << ss.str() << std::endl;

    std::cout << first.getInputSize() << std::endl;
}