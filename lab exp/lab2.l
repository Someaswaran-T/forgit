%{
#include <stdio.h>
#include <stdlib.h>
int flag=0;

%}

%%
"//"                        {flag++;}
"/*"                        {flag++;}
\n                             { /* Ignore empty lines */ }
.                             {}
%%

int main() {
    printf("Enter lines to check for comments (Ctrl+D to stop):\n");
    yylex();
  if(flag!=0)
{
printf("the given statement is command line");   
}
else
printf("the givev tatemnet is not a commant line ");
return 0;
}

int yywrap()
{
return 1;
}