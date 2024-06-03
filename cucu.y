%{

#include <stdio.h>
#include <string.h>
#include <math.h>
int yylex();
void yyerror(char const *);
extern FILE *yyin,*yyout,*lex_output;

%}

%token INT CHAR WHILE_TOKEN IF_TOKEN ELSE_TOKEN RETURN GREATER_THAN LESS_THAN DOUBLE_EQ LESS_THAN_EQUAL GREATER_THAN_EQUAL CHECKNOT_EQUAL
%union{
    int num;
    char *str;
}
%token <num> NUM
%token <str> ID
%token <str> STRING
%left '+' '-'
%left '*' '/'
%left '(' ')'

%%

programs : program
;

program : dec_of_var          {fprintf(yyout,"\n");}
    | dec_of_func             {fprintf(yyout,"\n");}
    | def_of_func              {fprintf(yyout,"\n");}
    | program dec_of_var      {fprintf(yyout,"\n");}
    | program dec_of_func     {fprintf(yyout,"\n");}
    | program def_of_func      {fprintf(yyout,"\n");}
;



dec_of_func : data_type var_name_or_ident '(' parmeters_of_function ')' ';'           {fprintf(yyout,"Function has been declared above\n\n");}
    | data_type var_name_or_ident '(' ')' ';'                                                {fprintf(yyout,"Function declared above\n\n");}
;

def_of_func : data_type var_name_or_ident '(' parmeters_of_function ')' body_of_function       {fprintf(yyout,"Function has been defined above\n\n");}
    | data_type var_name_or_ident '(' ')' body_of_function                      {fprintf(yyout,"Function Defined above\n\n");}
;

parmeters_of_function : data_type var_name_or_ident                   {fprintf(yyout,"Arguments to function has been passed\n\n");}
    | data_type var_name_or_ident ',' parmeters_of_function
;

data_type : INT       {fprintf(yyout,"Datatype : int\n");}
    | CHAR              {fprintf(yyout,"Datatype : char *\n");}
;

body_of_function : '{' list_of_statements '}'
    | '{' '}'
    | statement
;

dec_of_var : data_type var_name_or_ident ';'  
    | data_type var_name_or_ident '=' expression ';'        {fprintf(yyout,"Assignment of variable: =\n");}
    | CHAR var_name_or_ident '=' STRING ';'
;

list_of_statements : statement list_of_statements
    | statement
;

statement : assignment_stmt
    | function_call             {fprintf(yyout,"Function call has been completed \n\n");}
    | stmt_for_return           {fprintf(yyout,"Return statement \n\n");}
    | conditional_statement             {fprintf(yyout,"If Condition Ends \n\n");}
    | loop_statement                  {fprintf(yyout,"While Loop Ends \n\n");}
    | dec_of_var
    | expression ';'
;

assignment_stmt : expression '=' expression ';'
;

stmt_for_return : RETURN ';'
    | RETURN expression ';'
;

function_call : var_name_or_ident '(' ')' ';'
    | var_name_or_ident '(' expr_list ')' ';'
;

expr_list : stmt1 ',' expr_list
    | stmt1
;

stmt1 : EQUAL_stmt1
    |   boolean_expr
;

EQUAL_stmt1 : expression '=' expression
;

conditional_statement : IF_TOKEN '(' boolean_expr ')' body_of_function
    | IF_TOKEN '(' boolean_expr ')' body_of_function ELSE_TOKEN body_of_function
;

loop_statement : WHILE_TOKEN '(' boolean_expr ')' body_of_function
;

boolean_expr : boolean_expr LESS_THAN boolean_expr              {fprintf(yyout,"Comparison Operator : < \n");}
    | boolean_expr GREATER_THAN boolean_expr            {fprintf(yyout,"Comparison Operator : > \n");}
    | boolean_expr DOUBLE_EQ boolean_expr           {fprintf(yyout,"Comparison Operator : == \n");}
    | boolean_expr CHECKNOT_EQUAL boolean_expr       {fprintf(yyout,"Comparison Operator : != \n");}
    | boolean_expr LESS_THAN_EQUAL boolean_expr         {fprintf(yyout,"Comparison Operator : <= \n");}
    | boolean_expr GREATER_THAN_EQUAL boolean_expr      {fprintf(yyout,"Comparison Operator : >= \n");}
    | expression
;

var_name_or_ident : ID '[' expression ']'      {fprintf(yyout,"Variable : %s \n", $1);}
    | ID                                        {fprintf(yyout,"Variable : %s \n", $1);}
;

number : NUM    {fprintf(yyout,"Value : %d \n", $1);}
;

string : STRING {fprintf(yyout,"Value : %s \n", $1);}
;

expression : '(' expression ')'
    | expression '+' expression            {fprintf(yyout,"Arithmetic Operator : + \n");}
    | expression '-' expression           {fprintf(yyout,"Arithmetic Operator : - \n");}
    | expression '*' expression             {fprintf(yyout,"Arithmetic Operator : * \n");}
    | expression '/' expression             {fprintf(yyout,"Arithmetic Operator : / \n");}
    | expression '&' expression             {fprintf(yyout,"Logical Operator : & \n");}
    | expression '|' expression              {fprintf(yyout,"Logical Operator : | \n");}
    | number                    
    | var_name_or_ident
;



%%

int main()
{
    // change the file for input
    // Sample1.cu has correct Syntax
    // Samplw2.cu has wrong syntax
    yyin=fopen("Sample1.cu","r");
    //yyin=fopen("Sample2.cu","r");
    yyout=fopen("parser.txt","w");
    lex_output=fopen("lexer.txt","w");
    yyparse();
    return 0;
}

void yyerror(char const *s){
    printf("Syntax Error\n");
}