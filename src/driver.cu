#include <iostream>
#include "./layers/fullyConnectedLayer.h"

int main(){
    FullyConnectedLayer first = FullyConnectedLayer(60, 200);

    std::cout << first.getInputSize() << std::endl;
}