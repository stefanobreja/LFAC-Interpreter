%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "struct.h"
extern FILE* yyin;
extern int yylex();
extern int yylineno;
int yylex();
int yyerror(char* s);
struct INT_Struct int_struct[100];
int int_struct_nr = 0;
struct FLOAT_Struct float_struct[100];
int float_struct_nr = 0;
struct STRING_Struct;
int string_struct_nr = 0;

%}
%union{
    int INTvalue;
    double FLOATvalue;
    char* STRINGvalue;
}

%token TIPint TIPfloat TIPstring
%token INT_ID FLOAT_ID STRING_ID
%token BEGIN END ASSIGN PRINT
%token IF ELSE ENDIF
%token AND OR NOT 
%token <INTvalue>INT
%token <FLOATvalue>FLOAT
%token <STRINGvalue>STRING
%type <INTvalue>INT_ID


%%
/* Body structure */
body: BEGIN code END
    ;
/*
code: declarations
    | list declarations
    ;
*/
/* Assign 
declarations: AssignINT ';'
            | AssignFLOAT
            | AssignSTRING ';'
            | Print ';'
            | Function ';'
            | CtrlOpperations
            ;


Declare: Variable_dec
       | Function_dec
       | ArrayDeclaration
       ;
*/
/*Variable_dec: TIPint */


ArrayDeclaration: TIPint INT_ID '[' INT ']'
                | TIPSTRING IDstring '[' STRING ']'
     	        | TIPfloat IDfloat '[' FLOAT ']'
	            ;


        

/* expresii aritmetice */




%%



//error
void yyerror(char *Message){
    fprintf("TheonewiththeERR: %s at line:%d\n",Message,yylineno);
    exit(1);
}

int main(){
    yyparse();
    return 0;
}
