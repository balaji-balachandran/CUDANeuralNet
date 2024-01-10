#include "data_loader.h"

std::vector<std::vector<std::string>> DataLoader::ReadCSV(const std::string& filename){

    std::vector<std::vector<std::string>> data;
    std::ifstream file(filename);
    if (!file.is_open()) {
        std::cerr << "Error opening file: " << filename << std::endl;
        return data;
    }

    std::string line;
    while (std::getline(file, line)) {
        std::vector<std::string> tokens;
        std::istringstream tokenStream(line);
        std::string token;
        while (std::getline(tokenStream, token, ',')) {
            tokens.push_back(token);
        }
        data.push_back(tokens);
    }

    file.close();

    return data;
}
