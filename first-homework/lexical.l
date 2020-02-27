%option noyywrap
%option c++
%option yylineno

%{
    #include <iostream>
    #include <cstdlib>
%}

WS [ \t\n]
COMMENT \*.*
PROGRAM PROGRAM.*\.
VARIABLE [a-z]+
READ READ[ \t\n]TO[ \t\n]*
TERMINAL \.

%%

{COMMENT} std::cout << "COMMENT BLOCK: " << std::endl;
{PROGRAM} std::cout << "PROGRAM DEC" << std::endl;
{VARIABLE} std::cout << "VARIABLE" << std::endl;
{READ} std::cout << "READ KEYWORD" << std::endl;
{TERMINAL} std::cout << "TERMINAL" << std::endl;
%%