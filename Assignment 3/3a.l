%{ 
 /*lex program to recognise parts of speech in English - Without symbol table*/ 
%} 
%% 
car | 
house | 
man | 
state | 
ocean | 
country | 
city {printf("%s is a noun\n", yytext);}
I | 
my | 
she | 
he | 
it | 
we | 
they {printf("%s is a pronoun\n", yytext);}
come | 
go | 
walk | 
did | 
have |
read | 
write {printf("%s: is a verb\n", yytext);} 
pretty | 
old | 
blue | 
smart {printf("%s is an adjective\n", yytext);}
abnormally | 
accidentally | 
actually | 
beautifully | 
bitterly | 
brightly | 
calmly {printf("%s is an adverb\n", yytext);} 
by | 
with | 
about | 
until {printf("%s is an preposition\n", yytext);} 
and | 
but | 
or | 
while | 
because {printf("%s is an conjunction\n", yytext);} 
oh! | 
wow! | 
oops! {printf("%s is an interjection\n", yytext);} 
[a-zA-Z]+ {printf("%s : is not a part of speech\n", yytext);} 
. | \n ECHO; 
%% 
int main() { 
printf("Enter string: "); 
yylex();
} 
int yywrap(){ 
 return 1; 
} 
