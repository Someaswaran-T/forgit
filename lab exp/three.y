%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();  
int temp_count = 1; 
void yyerror(const char *s);

%}

%union {
    int num;          
    char* str;        
}

%token <num> NUMBER
%token <str> IDENTIFIER
%type <num> expression term factor
%type <str> statement

%%

program:
    statement
;

statement:
    IDENTIFIER '=' expression   { printf("T%d = %s = %s\n", temp_count++, $1, $3); }
;

expression:
    expression '+' term   { printf("T%d = %s + %s\n", temp_count++, $1, $3); }
  | expression '-' term   { printf("T%d = %s - %s\n", temp_count++, $1, $3); }
  | term
;

term:
    term '*' factor   { printf("T%d = %s * %s\n", temp_count++, $1, $3); }
  | term '/' factor   { printf("T%d = %s / %s\n", temp_count++, $1, $3); }
  | factor
;

factor:
    NUMBER          { printf("T%d = %d\n", temp_count++, $1); }
  | IDENTIFIER     { printf("T%d = %s\n", temp_count++, $1); }
;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(void) {
    printf("Enter an arithmetic expression: ");
    yyparse();
    return 0;
}
