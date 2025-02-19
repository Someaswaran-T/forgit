%{
#include<stdio.h>
int chars = 0, words = 0, spaces = 0, lines = 0;
%}

%%

[a-zA-Z0-9_]+ { words++; chars += yyleng; }  // Match words and count characters
[ \t]          { spaces++; chars++; }       // Match spaces
\n             { lines++; chars++; }        // Match newlines
.              { chars++; }                 // Match any other single character

%%

int main() {
    printf("Enter text (Ctrl+D to end):\n");
    yylex();  // Start the lexical analysis
    printf("Characters: %d\nWords: %d\nSpaces: %d\nLines: %d\n", chars, words, spaces, lines);
    return 0;
}

int yywrap() {
    return 1;
}
