%{
#include "y.tab.h"
%}

%%
[a-zA-Z][a-zA-Z0-9]*   { return VARIABLE; }
[ \t\n]                 { /* Ignore whitespace */ }
.                       { return 0; }  // Return 0 (nothing) for invalid characters
%%

int yywrap() {
    return 1;
}
