%{
#include<stdio.h>
%}

%%

[a-zA-Z_][a-zA-Z0-9_]* { printf("Valid Identifier: %s\n", yytext); }
.                       { printf("Invalid Identifier: %s\n", yytext); }

%%

int main() {
    printf("Enter strings (Ctrl+D to end):\n");
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
