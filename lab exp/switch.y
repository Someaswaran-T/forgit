%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%union {
    int num; // To store integer values for NUMBER tokens
    char* str; // For identifiers or string literals
}

%token SWITCH CASE DEFAULT COLON BREAK SEMICOLON IDENTIFIER NUMBER LPAREN RPAREN LBRACE RBRACE

%%

program:
    | program statement
    ;

statement:
    switch_stmt
    ;

switch_stmt:
    SWITCH LPAREN expression RPAREN LBRACE case_blocks RBRACE
    {
        printf("Recognized switch statement.\n");
    }
    ;

case_blocks:
    case_block
    | case_blocks case_block
    | DEFAULT COLON statements BREAK SEMICOLON
    {
        printf("Recognized default case.\n");
    }
    ;

case_block:
    CASE expression COLON statements BREAK SEMICOLON
    {
        printf("Recognized case block.\n");
    }
    ;

expression:
    IDENTIFIER
    | NUMBER
    ;

statements:
    | statements statement
    ;

%%

int main() {
    printf("Enter C code to parse switch case statement:\n");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    printf("Syntax error: %s\n", s);
}