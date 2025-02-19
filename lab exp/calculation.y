%{
#include<stdio.h>
#include<math.h>
int flag=0;
%}
%{
void yyerror();
int yylex();
%}

%union
{double p;}

%token	<p>num
%token	SIN	COS	TAN	SQRT	LOG;

%left	'+'	'-'
%left	'*'	'/'
%left	'('	')'

%type	<p>exp	


%%
ss:exp{printf("ans=%g \n",$1);}
exp:exp'+'exp	{$$=$1+$3;}
   |exp'-'exp	{$$=$1-$3;}
   |exp'*'exp	{$$=$1*$3;}
   |exp'/'exp	{$$=$1/$3;}
   |'-'exp      {$$=$2;}
   |SIN'('exp')'{$$=sin($3);}
   |COS'('exp')'{$$=cos($3);}
   |TAN'('exp')'{$$=tan($3);}
   |LOG'('exp')'{$$=log($3);}
   |SQRT'('exp')'{$$=sqrt($3);}
   |num;
   |'('exp')'    {$$=$2;}

%%

void main()
{
printf("\n enter the expression \n");
yyparse();
if(flag==0)
{
printf("\nvalid");
}
}
void yyerror()
{
printf("\ninvalid");
flag=1;;
}
