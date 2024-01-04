#include "layer_exception.h"

LayerException::LayerException(const std::string& message) : std::runtime_error(message) {
    std::cerr << "Layer Exception: " << message << std::endl;
}
