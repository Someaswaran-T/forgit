%{
#include <stdio.h>
int balance = 0; // To track parentheses balance
%}

%%

"("         { balance++; }
")"         { balance--; }
[a-zA-Z0-9] ; // Ignore variables and numbers
[+\-*/]     ; // Ignore operators
[ \t\n]     ; // Ignore whitespace
.           { printf("Invalid character: %s\n", yytext); }

%%

// Implementing the yywrap function
int yywrap() {
    return 1; // End of input reached
}

int main() {
    printf("Enter an expression to validate: ");
    yylex();
    if (balance == 0)
        printf("Valid expression: Parentheses are balanced.\n");
    else
        printf("Invalid expression: Parentheses are not balanced.\n");
    return 0;
}
