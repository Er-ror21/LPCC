%{ #include ây.tab.hâ
#include #include
%}
%%
[a-zA-Z] return A;
[0-9] return N;
â_â return U;
\n return 0;
. return yytext[0];
%%
