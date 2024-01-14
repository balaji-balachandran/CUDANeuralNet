#include "neural_net.h"

NeuralNet::NeuralNet(unsigned int input_size, unsigned int output_size): 
    input_size_(input_size), output_size_(output_size) {}

NeuralNet::NeuralNet(unsigned int input_size, unsigned int output_size, std::vector<Layer*> layers):
    input_size_(input_size), output_size_(output_size){

    // Validate input to ensure layers are compatible with one another
    // if(layers.size() != 0){
    //     unsigned int previous_size = input_size_;
    //     for(size_t i = 0; i < layers.size(); i++){
    //         if(layers[i]->input_size_ != previous_size){
    //             std::stringstream ss;
    //             ss << "Mismatched dimensions at Layer " << i 
    //                << " (Actual Input Size was " << layers[i]->input_size_ 
    //                << ", expected " << previous_size << ")";
    //             throw LayerException(ss.str());
    //         }
    //         previous_size = layers[i]->output_size_;
    //     }
    // }

    layers_ = layers;
}

void NeuralNet::AddLayer(Layer* layer){
    // Validate that the added layer is compatible with the existing layers
    // if(layers_.size() > 0 && 
    //    layers_[layers_.size() - 1]->output_size_ != layer.input_size_){
    //     std::stringstream ss;
    //     ss << "Mismatched dimensions at Layer " << layers_.size() 
    //        << " (Actual Input Size was " << layer->input_size_ 
    //        << ", expected " << layers_[layers_.size() - 1]->output_size_ << ")";
    //     throw LayerException(ss.str());
    // }

    layers_.push_back(layer);
}

void NeuralNet::SetLossFunction(LossFunction* loss_function){
    loss_function_ = loss_function;
}

float* NeuralNet::ForwardPropogation(float* x){
    
    for(const auto& layer : layers_){
        x = layer->Forward(x);
    }
    
    return x;
}

float* NeuralNet::GetLossGradient(float* y_predicted, int true_value){
    
    return loss_function_->GetGradient(y_predicted, true_value);
}

void NeuralNet::BackwardPropogation(float* error){
    for(int i = layers_.size() - 1; i >= 0; i--){
        error = layers_[i]->Backward(error);
    }
}
