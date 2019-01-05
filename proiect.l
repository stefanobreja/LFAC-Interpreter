%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
#include <string.h>
%}

%%
"TheOneWithTheI"    {return TIPint;}
"TheOneWithTheF"    {return TIPfloat;}
"TheOneWithTheS"    {return TIPstring;}

"TheOneWithTheSTART"    {return BEGIN;}
"TheOneWithTheEND"  {return END;}

"TheOneWithThePRINT"    {return PRINT;}
"whatif"    {return IF;}
"whateverelse"  {return ELSE;}
"releaseif" {return ENDIF;}
"AWhile"    {return WHILE;}
"NotAWhileAnymore"  {return ENDWHILE;}

\@[_a-zA-Z][_a-zA-Z0-9]*   {return ID_VARIABLE;}
"=|"    {return ASSIGN;}
[0-9]+  {return NUMBER;}
[0-9]+(\.[0-9]+)?([eE][0-9]+)?  {yylval.f = atof(yytext); return FLOAT_NUMBER;}
[-+()*/]    {return yytext[0];}
"|" {return OR;}
"&" {return AND;}
"!" {return NOT;}
[ \t]   ;
"\n"    {yylineno++;} 
.   {return yytext[0];}
%%
