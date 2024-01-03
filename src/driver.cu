#include <iostream>
#include "./layers/fully_connected_layer.h"

int main(){
    FullyConnectedLayer first = FullyConnectedLayer(60, 200);

    std::cout << first.getInputSize() << std::endl;
}