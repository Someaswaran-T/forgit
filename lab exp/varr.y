%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern char *yytext;

void yyerror(char *s) {
    printf("Error: %s\n", s);
}
%}

%token VARIABLE

%%

var:
    VARIABLE      { printf("Valid variable: %s\n", yytext); }
    ;

%%

int main() {
    yyparse();
    return 0;
}
