%{
#define YYSTYPE double
#include <stdio.h>
%}

%token NUM
%token PLUS MINUS TIMES DIVIDE
%token LEFT RIGHT
%token END

%left MINUS PLUS
%left DIVIDE TIMES
%left NEGATIVE

%define parse.error verbose

%%

Input: /* vazio */;
Input: Input Information;

Information: END;
Information: Expression END {
    printf("Resultado: %f\n\n", $1);
};

Expression: NUM { $$ = $1; };
Expression: Expression PLUS Expression { $$ = $1 + $3; };
Expression: Expression MINUS Expression { $$ = $1 - $3; };
Expression: Expression TIMES Expression { $$ = $1 * $3; };
Expression: Expression DIVIDE Expression { $$ = $1 / $3; };
Expression: LEFT Expression RIGHT { $$ = $2; };
Expression: MINUS Expression %prec NEGATIVE { $$ = -$2; };

%%

int yyerror(char const *s) {
    printf("\nEncontramos algo...%s\n", s);
    return 0;
}

int main() {

    yyparse();
    printf("Favor debugar e corrigir!\n");

    return 0;
}