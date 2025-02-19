%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%union {
    int num;  // To store integer values for NUMBER tokens
}

%token WHILE LPAREN RPAREN LBRACE RBRACE IDENTIFIER NUMBER
%token IF ELSE
%left '+' '-'
%left '*' '/'

%%

program:
    | program statement
    ;

statement:
    while_stmt
    | block
    ;

while_stmt:
    WHILE LPAREN expression RPAREN LBRACE statements RBRACE
    {
        printf("Recognized while loop with condition and statements.\n");
    }
    ;

expression:
    IDENTIFIER
    | NUMBER
    | expression '+' expression
    | expression '-' expression
    ;

block:
    LBRACE statements RBRACE
    ;

statements:
    | statements statement
    ;

%%

int main() {
    printf("Enter C code to parse while loop:\n");
    yyparse();  // Start parsing
    return 0;
}

void yyerror(const char *s) {
    printf("Syntax error: %s\n", s);
}
