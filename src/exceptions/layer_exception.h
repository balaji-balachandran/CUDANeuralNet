#pragma once
#include <stdexcept>
#include <string>
#include <iostream>

class LayerException : public std::runtime_error {
    public:
        explicit LayerException(const std::string& message);

};
