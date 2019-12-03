%{
#define YYSTYPE double
#include "FBCalculadora.tab.h"
%}

DIGIT [0-9]
INTEGER {DIGIT}+
REAL {INTEGER}("."{INTEGER})?

%%

{REAL} { 
			yylval=atof(yytext); 
			return NUM; 
		}

"+" return PLUS;
"-" return MINUS;
"*" return TIMES;
"/" return DIVIDE;

"(" return LEFT;
")" return RIGHT;

"\n" return END;
