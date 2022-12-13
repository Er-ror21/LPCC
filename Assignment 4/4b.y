%{ 
#include <stdio.h> 
#include <math.h> 
int flag=0; 
%} 
%token REMAINDER SQRT EXP NUMBER 
%% 
ArithmeticExpression: E{ 
 printf("\nResult=%d\n",$$); 
 return 0; 
 } 
E:REMAINDER'('NUMBER','NUMBER')' {if($5==0){printf("nan  error");return;} $$=$3%$5;} 
| SQRT'('NUMBER')' {if($3<0){printf("negative number");return;}  $$=sqrt($3);} 
| EXP'('NUMBER','NUMBER')' {$$=1;for(int i=0;i<$5;i++) {$$=$$*$3;}} 
| NUMBER {$$=$1;} 
; 
%% 
void main() 
{ 
 printf("\nEnter a built-in C function:\n"); 
 yyparse(); 
 if(flag==0) 
 printf("\nEntered function is Valid\n\n"); 
} 
void yyerror() 
{
printf("\nEntered function is Invalid\n\n");  
flag=1; 
} 
