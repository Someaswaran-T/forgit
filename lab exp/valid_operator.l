%{
#include <stdio.h>
#include <stdlib.h>

%}

%%
"+"             { printf("Valid Operator: ADDITION (+)\n"); }
"-"             { printf("Valid Operator: SUBTRACTION (-)\n"); }
"*"             { printf("Valid Operator: MULTIPLICATION (*)\n"); }
"/"             { printf("Valid Operator: DIVISION (/)\n"); }

"=="            { printf("Valid Operator: EQUALS (==)\n"); }
"!="            { printf("Valid Operator: NOT EQUALS (!=)\n"); }
"<"             { printf("Valid Operator: LESS THAN (<)\n"); }
">"             { printf("Valid Operator: GREATER THAN (>)\n"); }
"<="            { printf("Valid Operator: LESS THAN OR EQUAL TO (<=)\n"); }
">="            { printf("Valid Operator: GREATER THAN OR EQUAL TO (>=)\n"); }

"&&"            { printf("Valid Operator: LOGICAL AND (&&)\n"); }
"||"            { printf("Valid Operator: LOGICAL OR (||)\n"); }
"!"             { printf("Valid Operator: LOGICAL NOT (!)\n"); }

[ \t\n]+        { /* Ignore Whitespace */ }
.               { printf("Invalid Operator: %s\n", yytext); }

%%
int main() {
    printf("Enter operators to validate:\n");
    yylex();  // Start scanning input
    return 0;
}
int yywrap()
{
return 1;
}
