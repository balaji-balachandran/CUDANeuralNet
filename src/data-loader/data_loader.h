#pragma once
#include <string>
#include <vector>
#include <fstream>
#include <sstream>
#include <filesystem>

class DataLoader{
    public:
        DataLoader() = default;
        std::vector<std::vector<std::string>> ReadCSV(const std::string& filename);

};