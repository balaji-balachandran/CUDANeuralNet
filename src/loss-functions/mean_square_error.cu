#include "./mean_square_error.h"

float MeanSquaredError::GetLoss(float* y_true, float* y_predicted){
    float error = 0;
    for(size_t i = 0; i < num_classes_; i++){
        error += (y_true[i] - y_predicted[i]) * (y_true[i] - y_predicted[i]);
    }

    return error / num_classes_;
}

float* MeanSquaredError::GetGradient(float* y_true, float* y_predicted){
    float* error_gradient = new float[num_classes_];
    for(size_t i = 0; i < num_classes_; i++){
        error_gradient[i] = 2 / num_classes_ * (y_true[i] - y_predicted[i]);
    }

    return error_gradient;
}