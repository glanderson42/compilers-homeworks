#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib>

#include <FlexLexer.h>

class FlexLexerHandler {
private:
    std::ifstream input_;
    yyFlexLexer flexer_;

public:
    FlexLexerHandler(std::string&& path) {
        input_.open(path);
        if(!input_) {
            std::printf("%s file can not be opened!", path.c_str());  
            std::exit(-1);          
        }

        flexer_ = yyFlexLexer(&input_, &std::cout);
    }

    void evaluate() {
        flexer_.yylex();
    }
};


int main(int argc, char* argv[]) {
    auto flexer = FlexLexerHandler(std::move(argv[1]));
    flexer.evaluate();
}