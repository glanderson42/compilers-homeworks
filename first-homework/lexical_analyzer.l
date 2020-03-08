%option noyywrap
%option c++
%option yylineno

%{
    #include <iostream>
    #include <cstdlib>

    #define PRINT_MACRO(keyword, text) std::cout << keyword << ": " << text << std::endl;
%}

WS [ \t\n]
COMMENT \*.*
IDENTIFICATION [a-z][a-z,_,0-9]*
PROGRAM PROGRAM
TERMINAL \.
READ READ
MOVE MOVE
WRITE WRITE
TO TO
FROM FROM
DATA DATA
TYPE TYPE
TYPEDEF I|B
VARIABLE [a-z]+
VALUE [0-9]+
COMMA ,
BLOCK_CHAR :
IF IF
ELSE ELSE
ENDIF ENDIF
WHILE WHILE
ENDWHILE ENDWHILE
LESSER_THAN <
MORE_THAN >
EQUAL =
PLUS \+
MINUS -
AND AND
NOT NOT
OR OR
ADD ADD
BY BY
SUBTRACT SUBTRACT
MULTIPLY MULTIPLY
DIVIDE DIVIDE
MOD MOD

%%

^{COMMENT} {
    std::cout << "Comment block" << std::endl;
}

{PROGRAM} {
    PRINT_MACRO("Keyword", yytext);
}

{IDENTIFICATION} {
    PRINT_MACRO("Identification", yytext);
}

{READ} {
    PRINT_MACRO("Keyword", yytext);
}

{MOVE} {
    PRINT_MACRO("Keyword", yytext);
}

{WRITE} {
    PRINT_MACRO("Keyword", yytext);
}

{TO} {
    PRINT_MACRO("Keyword", yytext);
}

{BY} {
    PRINT_MACRO("Keyword", yytext);
}

{FROM} {
    PRINT_MACRO("Keyword", yytext);
}

{DATA} {
    PRINT_MACRO("Keyword", yytext);
}

{WHILE} {
    PRINT_MACRO("Keyword", yytext);
}

{ENDWHILE} {
    PRINT_MACRO("Keyword", yytext);
}

{IF} {
    PRINT_MACRO("Keyword", yytext);
}

{ELSE} {
    PRINT_MACRO("Keyword", yytext);
}

{ENDIF} {
    PRINT_MACRO("Keyword", yytext);
}

{SUBTRACT} {
    PRINT_MACRO("Keyword", yytext);
}

{ADD} {
    PRINT_MACRO("Keyword", yytext);
}

{MULTIPLY} {
    PRINT_MACRO("Keyword", yytext);
}

{DIVIDE} {
    PRINT_MACRO("Keyword", yytext);
}

{MOD} {
    PRINT_MACRO("Keyword", yytext);
}

{AND} {
    PRINT_MACRO("Logical", yytext);
}

{OR} {
    PRINT_MACRO("Logical", yytext);
}

{NOT} {
    PRINT_MACRO("Logical", yytext);
}


{LESSER_THAN} {
    PRINT_MACRO("Compare char", yytext);
}

{MORE_THAN} {
    PRINT_MACRO("Compare char", yytext);
}

{EQUAL} {
    PRINT_MACRO("Operation char", yytext);
}

{PLUS} {
    PRINT_MACRO("Operation char", yytext);
}

{MINUS} {
    PRINT_MACRO("Operation char", yytext);
}

{BLOCK_CHAR} {
    PRINT_MACRO("Block char", yytext);
}

{TYPE} {
    PRINT_MACRO("Keyword", yytext);
}

{TYPEDEF} {
    PRINT_MACRO("Typedef", yytext);
}

{VARIABLE} {
    PRINT_MACRO("Variable", yytext);
}

{VALUE} {
    PRINT_MACRO("Value", yytext);
}

{COMMA} {
    PRINT_MACRO("Separate char", yytext);
}

{TERMINAL} {
    PRINT_MACRO("Terminal", yytext);
}

{WS}+ //nothing to do

. {
    std::cout << "Lexical error at: " << lineno() << std::endl;
    std::exit(-1);
}

%%