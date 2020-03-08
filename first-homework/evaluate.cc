#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib>

#include <FlexLexer.h>

class FlexLexerHandler {
private:
    std::ifstream input_;
    yyFlexLexer* flexer_;

public:
    template<class T>
    FlexLexerHandler(char path[], T& outputStream) {
        input_.open(path);
        if(!input_) {
            std::fprintf(stderr, "%s file can not be opened!", path);  
            std::exit(-1);          
        }

        flexer_ = new yyFlexLexer(&input_, &outputStream);
    }

    void evaluate() {
        flexer_->yylex();
    }

    virtual ~FlexLexerHandler() {
        delete flexer_;
    }
};


int main(int argc, char* argv[]) {
    if(argc < 2) {
        std::exit(-1);
    }

    FlexLexerHandler flexer(argv[1], std::cout);
    flexer.evaluate();
}