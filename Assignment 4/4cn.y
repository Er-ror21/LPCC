%{
#include #include
%}
%token A N U
%%
a : AN 
|aA
|aN 
|aUa 
|A ;
%% int main()
{
printf(“enter the string”);
yyparse();
printf(“valid variable”);
} void yyerror()
{ printf(“invalid variable”); exit(0); }
