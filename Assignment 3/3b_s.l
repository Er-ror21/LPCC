%{
#include<stdio.h>
#include<string.h>
enum{
lookup=0,
TEXT,
KEYWORD,
DATATYPE,
CONDITIONAL,
ITERATIVE,
ARITHMETIC_OP,
};
int state;
int lookup_word(char *word);
int add_word(int type,char *word);
%}
%%
\n {state=lookup;}
^text {state=TEXT;}
^keyword {state=KEYWORD;}
^datatype {state=DATATYPE;}
^conditional {state=CONDITIONAL;}
^iterative {state=ITERATIVE;}
^arithmetic_op {state=ARITHMETIC_OP;}
[a-zA-Z]+ {
if(state!=lookup){
add_word(state,yytext);
}
else{
switch(lookup_word(yytext)){
case TEXT:printf("%s:text\n",yytext);break;
case KEYWORD:printf("%s:keyword\n",yytext);break;
case DATATYPE:printf("%s:datatype\n",yytext);break;
case CONDITIONAL:printf("%s:conditional\n",yytext);break;
case ITERATIVE:printf("%s:iterative \n",yytext);break;
case ARITHMETIC_OP:printf("%s:arithmetic operation\n",yytext);break;
default:printf("%s:did not recognize\n",yytext);break;
}
}
}
.
%%
int yywrap(void){}
int main(){
yylex();
return 0;
}
/*making a linked list of words and their types*/
struct word{
char *word_name;
int word_type;
struct word *next;
};
struct word *word_list;
extern void *malloc();
/* adding the word to the linkedlist */
int add_word(int type,char *word){
struct word *wp;
if(lookup_word(word)!=lookup){
printf("%s !!!Warning word already exists \n",word);
return 0;
}
wp=(struct word*)malloc(sizeof(struct word));
wp->next=word_list;
wp->word_name=(char*)malloc(strlen(word)+1);
strcpy(wp->word_name,word);
wp->word_type=type;
word_list=wp;
/* done successfully */
return 1;
}
/* checking for the word if it exsists in the table */
int lookup_word(char *word){
struct word *wp=word_list;
for(;wp;wp=wp->next){
if(strcmp(wp->word_name,word)==0){
return wp->word_type;
}
}
return lookup;
}

