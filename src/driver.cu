#include <iostream>
#include "./layers/fully_connected_layer.cu"
#include "./activation-functions/relu.cu"
#include "./exceptions/layer_exception.cu"
#include "./loss-functions/mean_square_error.cu"
#include "./activation-functions/softmax.cu"
#include "./data-loader/data_loader.cu"
#include "./neural_net.cu"
#include <sstream>

int main(){

    // float* input_data = new float[3];
    // input_data[0] = 1;
    // input_data[1] = 3;
    // input_data[2] = 2;

    // Softmax layer = Softmax(3, false);
    // float* layer_output = layer.Forward(input_data);
    // float* error = new float[3];
    // error[0] = 1;
    // error[1] = 0.5;
    // error[2] = 0.8;


    // float* d_error_d_inp = layer.Backward(error);
    // for(size_t i = 0; i < 3; i++){
    //     std::cout << d_error_d_inp[i] << std::endl;
    // }


    DataLoader reader = DataLoader();
    auto data = reader.ReadCSV("./data/mnist_train.csv");
    std::cout << data.size() << std::endl;
    std::cout << data[0].size() << std::endl;
    const int INPUT_SIZE  = 784;
    const int NUM_CLASSES = 10;
    NeuralNet model(INPUT_SIZE, NUM_CLASSES);

    Layer* first_hidden_layer = new FullyConnectedLayer(784, 10, false);
    Layer* first_activation_function = new ReLU(10, false);
    Layer* second_hidden_layer = new FullyConnectedLayer(10, 10, false);
    Layer* softmax = new Softmax(10, false);

    model.AddLayer(first_hidden_layer);
    model.AddLayer(first_activation_function);
    model.AddLayer(second_hidden_layer);
    model.AddLayer(softmax);

    LossFunction* loss_fn = new MeanSquaredError(NUM_CLASSES);
    model.SetLossFunction(loss_fn);

    float* x = new float[INPUT_SIZE];
    for(int j = 0; j < data.size(); j++){

        for(int a = 0; a < 28; a++){
            for(int b = 0; b < 28; b++){
                int out = std::stoi(data[j][a * 28 + b + 1]) > 0;
                std::cout << out;
            }
            std::cout << std::endl;
        }
        auto row = data[j];
        int true_value = std::stoi(row[0]);
        for(int i = 1; i < row.size(); i++){
            x[i - 1] = std::stoi(row[i]) / (float) 255;
        }

        float* y_predicted = model.ForwardPropogation(x);
        float predicted = 0;
        float predicted_prob = y_predicted[0];
        for(int i = 1; i < NUM_CLASSES; i++){
            if(y_predicted[i] > predicted_prob){
                predicted_prob = y_predicted[i];
                predicted = i;
            }
            std::cout << y_predicted[i] << std::endl;
        }
        std::cout << "Predicted " << predicted << " with probability "
        << predicted_prob << ", actual " << true_value << std::endl;
        float* error = model.GetLossGradient(y_predicted, true_value);
        for(int i = 0; i < 10; i++){
            std::cout << error[i] << std::endl;
        }
        model.BackwardPropogation(error);
        
    }
    
    std::cout << "GOT HERE" << std::endl;
    delete[] x;

    // float* input_data = new float[3];
    // for(int i = 0; i < 3; i++){
    //     input_data[i] = 0.8 - i;
    // }

    // FullyConnectedLayer first =    FullyConnectedLayer(3, 4, false);

    // float* output = first.Forward(input_data);
    // for(int i = 0; i < first.GetOutputSize(); i++){
    //     std::cout << output[i] << std::endl;
    // }

    // // [3, 6, 9, 12]
    // float* d_error = new float[4];
    // for(int i = 0; i < 4; i++){
    //     d_error[i] = 3 * (i + 1);
    // }

    // float* d_error_input = first.Backward(d_error);
    // for(int i = 0; i < 3; i++){
    //     std::cout <<  d_error_input[i] << std::endl;
    // }

    // // NAIVE RELU TESTS
    // ReLU layer = ReLU(3, false);
    // float* layer_output = layer.Forward(input_data);
    // for(int i = 0; i < 3; i++){
    //     std::cout << layer_output[i] << std::endl;
    // }

    // float* d_error = new float[3];
    // for(int i = 0; i < 3; i++){
    //     d_error[i] = 0.4 - (0.3 * i);
    // }
    // float* d_error_d_input = layer.Backward(d_error);

    // for(int i = 0; i < 3; i++){
    //     std::cout << d_error_d_input[i] << std::endl;
    // }
    
    // MeanSquaredError loss_fn = MeanSquaredError(3);
    // float* y_true = new float[3];
    // float* y_predicted = new float[3];

    // y_true[0] = 1;
    // y_true[1] = 0;
    // y_true[2] = 0;

    // y_predicted[0] = 0.2;
    // y_predicted[1] = 0.6;
    // y_predicted[2] = 0;

    // float* d_err = loss_fn.GetGradient(y_true, y_predicted);
    // for(int i = 0; i < 3; i++)
    //     std::cout << d_err[i] << std::endl;

}