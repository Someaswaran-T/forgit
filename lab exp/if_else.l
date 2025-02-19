%{
#include "y.tab.h" // Include token definitions from YACC
%}

%option noyywrap

/* Define tokens for the lexical analyzer */
%%
"if"        { return IF; }
"else"      { return ELSE; }
"("         { return LPAREN; }
")"         { return RPAREN; }
"{"         { return LBRACE; }
"}"         { return RBRACE; }
[ \t\n]+    ; /* Ignore whitespace */
[a-zA-Z_][a-zA-Z_0-9]* { return IDENTIFIER; } /* Match variable names */
[0-9]+      { return NUMBER; } /* Match numbers */
"=="        { return EQ; }
"!="        { return NE; }
"<"         { return LT; }
">"         { return GT; }
"<="        { return LE; }
">="        { return GE; }
"="         { return ASSIGN; }
.           { return yytext[0]; } /* Return any other character */

%%
