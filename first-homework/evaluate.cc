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
    FlexLexerHandler(char path[]) {
        input_.open(path);
        if(!input_) {
            std::fprintf(stderr, "%s file can not be opened!", path);  
            std::exit(-1);          
        }

        flexer_ = new yyFlexLexer(&input_, &std::cout);
    }

    void evaluate() {
        flexer_->yylex();
    }

    ~FlexLexerHandler() {
        delete flexer_;
    }
};


int main(int argc, char* argv[]) {
    if(argc < 2) {
        std::exit(-1);
    }

    FlexLexerHandler flexer(argv[1]);
    flexer.evaluate();
}