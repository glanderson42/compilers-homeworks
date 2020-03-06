default: evaluate.cc lexical.l
	flex lexical.l
	g++ -std=c++11 -o evaluate.out evaluate.cc lex.yy.cc -w

lex: lexical.l
	flex lexical.l

clean: rm lex.yy.cc evaluate.out