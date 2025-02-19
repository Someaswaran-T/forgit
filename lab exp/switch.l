%{
#include <stdio.h>
#include <ctype.h>
#include "y.tab.h" // Include YACC's generated header to define token types
%}

%%

"switch"            { return SWITCH; }
"case"              { return CASE; }
"default"           { return DEFAULT; }
":"                 { return COLON; }
"break"             { return BREAK; }
";"                 { return SEMICOLON; }
"("                 { return LPAREN; }
")"                 { return RPAREN; }
"{"                 { return LBRACE; }
"}"                 { return RBRACE; }
[0-9]+               { yylval.num = atoi(yytext); return NUMBER; }
[A-Za-z_][A-Za-z0-9_]* { return IDENTIFIER; }

[ \t\n\r]+           { /* Skip whitespace */ }

.                    { /* Ignore other characters */ }

%%

int yywrap() {
    return 1; // Required by Flex
}