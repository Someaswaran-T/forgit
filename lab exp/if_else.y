%{
#include <stdio.h>
#include <stdlib.h>

/* Function declarations */
extern int yylex(); // Declare yylex from LEX
extern int yyparse(); // Declare yyparse from YACC
void yyerror(const char *s);
int flag=0;

%}

/* Declare tokens */
%token IF ELSE LPAREN RPAREN LBRACE RBRACE IDENTIFIER NUMBER EQ NE LT GT LE GE ASSIGN

%%

/* Grammar rules */
start
    : if_else_structure
    printf("syntax is right ");
    ;

if_else_structure
    : IF LPAREN condition RPAREN block
    | IF LPAREN condition RPAREN block ELSE block
    ;

condition
    : IDENTIFIER comparison_op IDENTIFIER
    | IDENTIFIER comparison_op NUMBER
    | NUMBER comparison_op IDENTIFIER
    | NUMBER comparison_op NUMBER
    ;

comparison_op
    : EQ
    | NE
    | LT
    | GT
    | LE
    | GE
    ;

block
    : LBRACE statements RBRACE
    ;

statements
    : /* Empty */
    | statements statement
    ;

statement
    : IDENTIFIER ASSIGN expression ';'
    ;

expression
    : IDENTIFIER
    | NUMBER
    ;

%%

void yyerror(const char *s) {
flag=1;
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter an if-else structure: ");
    return yyparse();
if(flag==0)
printf("valid");
else
printf("invalid");
}
