%{
#include <stdio.h>
#include <stdlib.h>

int  yylex();
void yyerror();

int flag = 1; 
 %}

%token NUM
%left '+' '-'
%left '*' '/'
%left UMINUS

%%

expr:
      expr '+' expr       { $$ = $1 + $3; }
    | expr '-' expr       { $$ = $1 - $3; }
    | expr '*' expr       { $$ = $1 * $3; }
    | expr '/' expr       {
                            if ($3 == 0)
                                yyerror("Division by zero!");
                            else
                                $$ = $1 / $3;
                          }
    | '(' expr ')'        { $$ = $2; }
    | '-' expr            { $$ = -$2; }
    | NUM                 { $$ = $1; }
    ;

%%

void yyerror() {
    printf("Invalid expression");
    flag = 0;  
}

void  main() {
    printf("Enter an arithmetic expression: ");
    flag = 1;  
    yyparse();
    
    if (flag == 1) {
        printf("Valid expression\n");
    } else {
        printf("Invalid expression\n");
    }
    

}
