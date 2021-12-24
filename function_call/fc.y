%{
#include <stdio.h>
int yylex(void);
void yyerror(char *);
%}
%token FUNCNAME INPUT DEF_INT DEF_DOUBLE DEF_CHAR DEF_BOOL DEF_VOID S E EQ END CR

%%

	line_list: line
			 | line_list line
			 ;
			 
		 
	   line: DEF_INT FUNCNAME INPUT S FUNCNAME INPUT CR E {printf("%s->$s",$2,$5);}
			 | DEF_DOUBLE FUNCNAME INPUT S FUNCNAME INPUT CR E
			 | DEF_CHAR FUNCNAME INPUT S FUNCNAME INPUT CR E
			 | DEF_BOOL FUNCNAME INPUT S FUNCNAME INPUT CR E 

%%

void yyerror(char *str){
    fprintf(stderr,"error:%s\n",str);
}

int yywrap(){
    return 1;
}
int main()
{
    yyparse();
}
