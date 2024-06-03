%{

#include <stdio.h>
#include <string.h>
#include <math.h>
#include "cucu.tab.h"
FILE *lex_output;

%}

%%

while                {fprintf (lex_output,"WHILE : while\n"); return WHILE_TOKEN;/*regular expression for while*/}
if                  {fprintf (lex_output,"IF : if\n"); return IF_TOKEN;/* regular expression for if */}
else                  {fprintf (lex_output,"ELSE : else\n"); return ELSE_TOKEN;/* regular expression for else */}
"int"                   {fprintf (lex_output,"TYPE : int\n"); return INT;/* regular expression for int */}
"char *"              {fprintf (lex_output,"TYPE : char*\n"); return CHAR;/* regular expression for char* */}
return               {fprintf (lex_output, "RETURN : return\n"); return RETURN;/* regular expression for return */}
[a-zA-Z_][a-zA-Z0-9_]*  {fprintf (lex_output,"ID : %s\n", yytext); yylval.str=strdup(yytext); return ID;/* regular expression for identifier */}
(\"[a-zA-Z0-9]*\")      {fprintf (lex_output, "TYPE : string"); yylval.str=strdup(yytext); return STRING;/* regular expression for string */}
[0-9]+                  {fprintf (lex_output,"NUM : %d\n", yylval.num=atoi(yytext)); return NUM;/* regular expression for number */}
[\{]                    {fprintf (lex_output,"OPEN_CURLY : {\n"); return yytext[0];/* regular expression for open cur;y bracket */}
[\}]                    {fprintf (lex_output,"CLOSE_CURLY : }\n"); return yytext[0];/* regular expression for close curly bracket */}
[\(]                    {fprintf (lex_output,"LEFT_BRAC : (\n"); return yytext[0];/* regular expression for open bracket */}
[\)]                    {fprintf (lex_output,"RIGHT_BRAC : )\n"); return yytext[0];/* regular expression for close bracket */}
[\[]                    {fprintf (lex_output,"LEFT_SQBRAC : [\n"); return yytext[0];/* regular expression for open square bracket */}
[\]]                    {fprintf (lex_output,"RIGHT_SQBRAC : ]\n"); return yytext[0];/* regular expression for close square bracket */}
">"                     {fprintf (lex_output,"GREATER_THAN : >\n"); return GREATER_THAN;/* regular expression for greater than sign */}
","                     {fprintf (lex_output,"COMMA : ,\n"); return yytext[0];/* regular expression for comma sign*/}
"="                     {fprintf (lex_output,"EQUAL : =\n"); return yytext[0];/* regular expression for equal sign */}
"+"                     {fprintf (lex_output,"ADDITION : +\n"); return yytext[0];/* regular expression for plus sign */}
"-"                     {fprintf (lex_output,"SUBTRACTION : -\n"); return yytext[0];/* regular expression for minus sign */}
"&"                     {fprintf (lex_output,"LOGICAL AND : &\n"); return yytext[0];/* regular expression for & sign */}
"|"                     {fprintf(lex_output,"LOGICAL OR : |\n"); return yytext[0];/* regular expression for | sign */}
"/"                     {fprintf (lex_output,"DIVIDE : /\n"); return yytext[0];/* regular expression for divide sign */}
"*"                     {fprintf (lex_output,"MULTIPLY : *\n"); return yytext[0];/* regular expression for multiply sign */}
";"                     {fprintf (lex_output,"SEMI : ;\n"); return yytext[0];/* regular expression for semi colon */}
"<"                     {fprintf (lex_output,"LESS_THAN : <\n"); return LESS_THAN;/* regular expression for < sign */}
"=="                    {fprintf (lex_output,"CHECKEQUAL : ==\n"); return DOUBLE_EQ;/* regular expression for "=="" */}
"<="                    {fprintf (lex_output,"LESS_THAN_EQUAL : <=\n"); return LESS_THAN_EQUAL;/* regular expression for <= */}
">="                    {fprintf (lex_output,"GREATER_THAN_EQUAL : >=\n"); return GREATER_THAN_EQUAL;/* regular expression for ">=" */}
"!="                    {fprintf (lex_output,"CHECKNOT_EQUAL : !=\n"); return CHECKNOT_EQUAL;/* regular expression for "!=" */}
\/\*([^(\*\/)]|\n)*\*\/  {/*Regular expression for Comment;*/}       
[ \t\n]+                ;       
%%
int yywrap(){
    return 1;
}