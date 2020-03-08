default: evaluate.cc lexical_analyzer.l
	flex lexical_analyzer.l
	g++ -std=c++11 -o evaluate.out evaluate.cc lex.yy.cc -w

lex: lexical_analyzer.l
	flex lexical_analuyer.l

clean: rm lex.yy.cc evaluate.out