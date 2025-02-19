%{
#include <stdio.h>
#include <ctype.h>
#include "y.tab.h"  // Include YACC's generated header to define token types
%}

%%

"while"              { return WHILE; }
"("                  { return LPAREN; }
")"                  { return RPAREN; }
"{"                  { return LBRACE; }
"}"                  { return RBRACE; }
[0-9]+               { yylval.num = atoi(yytext); return NUMBER; }
[A-Za-z_][A-Za-z0-9_]* { return IDENTIFIER; }

[ \t\n\r]+           { /* Skip whitespace */ }

.                    { /* Ignore other characters */ }

%%

// Remove the main() function here
// int main() {
//     yylex();  // Start lexical analysis
//     return 0;
// }

int yywrap() {
    return 1;  // Required by Flex
}
