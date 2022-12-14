%{ 
/*Lex program for subset of C programming language*/ 
#include<stdio.h> 
%} 
%% 
[0-9]+ {printf("%s is a  number\n", yytext);} 
auto | 
break | 
case | 
char | 
const | 
default | 
double |
enum | 
extern | 
float | 
goto | 
int | 
long | 
register | 
short | 
signed | 
unsigned | 
sizeof | 
static | 
struct | 
switch | 
typedef | 
union | 
void | 
volatile | 
if | 
else | 
while | 
do | 
for | 
return {printf("%s: is a  keyword\n", yytext);} 
%s | 
%d | 
%f | 
%c {printf("%s: is a format specifier\n", yytext);} 
"++" {printf("%s: is an increment operator\n", yytext);} 
"--" {printf("%s: is an decrement operator\n", yytext);}
"+" | 
"-" | 
"*" | 
"/" | 
"%" {printf("%s: is an arithmetic operator\n", yytext);} 
"&&" | "||" {printf("%s: is a logical operator\n",  yytext);} 
"<=" | 
">=" | 
"==" | 
"<" | 
">" {printf("%s: is a relational operator\n",yytext);} 
"=" {printf("%s: is an assignment operator\n", yytext);} 
"[" | 
"]" | 
"(" | 
")" | 
"{" | 
"}" {printf("%s: is bracket\n", yytext);} 
";" {printf("%s: is a semicolon\n", yytext);} 
[a-zA-Z_][a-zA-Z0-9_]* {printf("%s: is an identifier\n",  yytext);} 
. | \n {printf("%s: other\n", yytext);} 
%% 
int main() { 
printf("Enter string: "); 
yylex(); 
} 
int yywrap() {
return 1; 
} 
