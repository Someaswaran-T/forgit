%{
#include "y.tab.h"  // Include the token definitions from Bison/Yacc
#include <stdio.h>
#include <stdlib.h>
#include <string.h>  // Include for strdup
%}

%%

[0-9]+          { yylval.num = atoi(yytext); return NUMBER; }
[a-zA-Z]+       { yylval.str = strdup(yytext); return IDENTIFIER; }

"+"             { return '+'; }
"-"             { return '-'; }
"*"             { return '*'; }
"/"             { return '/'; }
"="             { return '='; }

[ \t\n]+        { /* Skip whitespace */ }

%%

int yywrap(void) {
    return 1;
}
