/* DEHAO DAI */
/* Heng Tan */

%{
	#include "y.tab.h"
    int currLine = 1, currPos = 1;
%}

DIGIT   [0-9]
ALPHA   [a-zA-Z]
IDENT   {ALPHA}+(({ALPHA}|{DIGIT}|[_])+({ALPHA}|{DIGIT}))*
ID      [ID][a-z0-9]*

%%
"-"		{currPos += yyleng; return SUB;}
"+" 	{currPos += yyleng; return ADD;}
"*" 	{currPos += yyleng; return MULT;}
"/" 	{currPos += yyleng; return DIV;}
"%" 	{currPos += yyleng; return MOD;}
"==" 	{currPos += yyleng; return EQ;}
"<>" 	{currPos += yyleng; return NEQ;}
"<" 	{currPos += yyleng; return LT;}
">" 	{currPos += yyleng; return GT;}
"<=" 	{currPos += yyleng; return LTE;}
">=" 	{currPos += yyleng; return GTE;}
";" 	{currPos += yyleng; return SEMICOLON;}
":" 	{currPos += yyleng; return COLON;}
"," 	{currPos += yyleng; return COMMA;}
"(" 	{currPos += yyleng; return L_PAREN;}
")" 	{currPos += yyleng; return R_PAREN;}
"[" 	{currPos += yyleng; return L_SQUARE_BRACKET;}
"]" 	{currPos += yyleng; return R_SQUARE_BRACKET;}
":=" 	{currPos += yyleng; return ASSIGN;}


"function"              {currPos += yyleng; return FUNCTION;}
"beginparams"           {currPos += yyleng; return BEGINPARAMS;}
"endparams"             {currPos += yyleng; return ENDPARAMS;}
"beginlocals"           {currPos += yyleng; return BEGINLOCALS;}
"endlocals"             {currPos += yyleng; return ENDLOCALS;}
"beginbody"             {currPos += yyleng; return BEGINBODY;}
"endbody"               {currPos += yyleng; return ENDBODY;}
"integer"               {currPos += yyleng; return INTEGER;}
"array"                 {currPos += yyleng; return ARRAY;}
"of"                    {currPos += yyleng; return OF;}
"if"                    {currPos += yyleng; return IF;}
"then"                  {currPos += yyleng; return THEN;}
"endif"                 {currPos += yyleng; return ENDIF;}
"else"                  {currPos += yyleng; return ELSE;}
"while"                 {currPos += yyleng; return WHILE;}
"do"                    {currPos += yyleng; return DO;}
"for"					{currPos += yyleng; return FOR;}
"beginloop"             {currPos += yyleng; return BEGINLOOP;}
"endloop"               {currPos += yyleng; return ENDLOOP;}
"read"                  {currPos += yyleng; return READ;}
"write"                 {currPos += yyleng; return WRITE;}
"and"                   {currPos += yyleng; return AND;}
"or"                    {currPos += yyleng; return OR;}
"not"                   {currPos += yyleng; return NOT;}
"true"                  {currPos += yyleng; return TRUE;}
"false"                 {currPos += yyleng; return FALSE;}
"return"                {currPos += yyleng; return RETURN;}
"continue"              {currPos += yyleng; return CONTINUE;}

(##).* 			{currPos += yyleng;}

{IDENT}+		{currPos += yyleng; yylval.identVal = yytext; return IDENT;}
{DIGIT}+ 		{currPos += yyleng; yylval.numVal = atoi(yytext); return NUMBER;}

[0-9_][a-zA-Z0-9_]*[a-zA-Z0-9_] {printf("Error at line %d, column %d: identifier \"%s\" must begin with a letter\n", currPos, currLine, yytext); exit(0);}
[a-zA-Z0-9_]*[_] {printf("Error at line %d, column %d: identifier \"%s\" cannot end with an underscore\n", currPos, currLine, yytext); exit(0);}

[ \t]+                  {currPos += yyleng;}

"\n"                    {currLine++; currPos = 1;}

. {printf("Error at line %d. column %d: unrecognized symbol \"%s\"\n", currLine, currPos, yytext); exit(0);}

%%
/*
int main (int argc, char** argv) {
	if (argc >= 2) {
		if (yyin == NULL) {
			yyin = stdin;
		}
	}
	else {
		yyin = stdin;
	}
	yylex();
	return 0;
}*/
