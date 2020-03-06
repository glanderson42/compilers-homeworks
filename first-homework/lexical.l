%option noyywrap
%option c++
%option yylineno

%{
    #include <iostream>
    #include <cstdlib>
%}


WS [ \t\n]
COMMENT \*.*
PROGRAM PROGRAM[ \t\n][a-zA-Z]+\.
VARIABLE [a-z]+
READ READ
TO {WS}TO{WS}
MOVE MOVE{WS}
ADD ADD
WHILE WHILE{WS}
ENDWHILE ENDWHILE
SOMETHING :
DATA DATA{SOMETHING}
TYPE {WS}TYPE{WS}
INTEGER I
BOOLEAN B
TYPEDEF I|B
COMMA ,
DIGIT [0-9]
DIGITS [0-9]+
TRUE true
FALSE false
WRITE WRITE
AND AND
IF IF
ENDIF ENDIF
LESSER_THAN {WS}*<
MORE_THAN {WS}*>
TERMINAL \.

%%



{COMMENT} {
    std::cout << "COMMENT" << std::endl;
}

{PROGRAM} {
    std::cout << "Keyword: " << yytext << std::endl;
}

{READ} {
    std::cout << "Keyword: " << yytext << std::endl;
}

{MOVE} {
    std::cout << "Keyword: " << yytext << std::endl;
}

{TO} {
    std::cout << "Keyword: " << yytext << std::endl;
}

{ADD} {
    std::cout << "Keyword: " << yytext << std::endl;
}

{WHILE} {
    std::cout << "Keyword: " << yytext << std::endl;
}

{ENDWHILE} {
    std::cout << "Keyword: " << yytext << std::endl;
}

{DATA} {
    std::cout << "Keyword: " << yytext << std::endl;
}

{TYPE} {
    std::cout << "Keyword: " << yytext << std::endl;
}

{VARIABLE} {
    std::cout << "Variable: " << yytext << std::endl; 
}

{DIGITS} {
    std::cout << "Value: " << yytext << std::endl;
}

{TERMINAL} {
    std::cout << "Terminal: " << yytext << std::endl;
}

{AND} {
    std::cout << "Keyword: " << yytext << std::endl;
}

{IF} {
    std::cout << "Keyword: " << yytext << std::endl;
}

{ENDIF} {
    std::cout << "Keyword: " << yytext << std::endl;
}

{WRITE} {
    std::cout << "Keyword: " << yytext << std::endl;
}

{TYPEDEF} {
    std::cout << "Typedef: " << yytext << std::endl;
}

{LESSER_THAN} {
    std::cout << "Lesser than: " << yytext << std::endl;
}

{MORE_THAN} {
    std::cout << "More than: " << yytext << std::endl;
}

{COMMA} {
    std::cout << "Separate char: " << yytext << std::endl;
}

"+" std::cout << "PLUS" << std::endl;
"-" std::cout << "MINUS" << std::endl;
"=" std::cout << "EQUALS" << std::endl;

. {
    std::cout << "Lexical error: " << yylineno << std::endl;
    std::exit(1);
}


{WS}+ // nothing to do
%%