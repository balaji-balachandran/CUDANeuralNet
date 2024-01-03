class ActivationFunction {
    public:
        ActivationFunction(); 

        virtual void Forward() = 0;
        virtual void Backward() = 0;

};