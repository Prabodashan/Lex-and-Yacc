%{
#include <stdio.h>
#include "lex.yy.c"

int yyerror(const char *s);
%}

%union{
    char *sValue;
    int iValue;
}

%token <sValue> STRING
%token <iValue> INT

%%

prog:
    function
;

function:
    | function stmt

stmt:
    STRING { printf("You entered a string - %s", $1) }| 
    INT { printf("You entered a integer - %d", $1) }
;

%%

int yyerror(const char *s){
    printf("%s\n", s);
    return 0;
}

int main(){
    yyparse();
    return 0;
}