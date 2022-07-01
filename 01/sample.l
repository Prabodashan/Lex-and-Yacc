%{
#include <stdio.h>
#include "sample.tab.h"

int yyerror(const char *);

%}

%%
[a-zA-Z]+   {yylval.sValue = yytext; return STRING;}
0           {yylval.iValue = atoi(yytext); return INT;}
[0-9]+      {yylval.iValue = atoi(yytext); return INT;}
.           yyerror("Unknown Character");
%%
int yywrap(void) {
    return 1;
}