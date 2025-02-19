%{
#include "y.tab.h"
%}

%%

[0-9]+        { yylval = atoi(yytext); return NUM; }
[+\-*/()]     { return yytext[0]; }
\n            { return 0; }
[ \t]         { /* ignore spaces */ }
.             { return yytext[0]; }

%%
int yywrap()
{
return 1;
}