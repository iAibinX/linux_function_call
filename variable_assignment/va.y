%{
#include <stdio.h>
int yylex(void);
void yyerror(char *);
%}
%token DEF_INT DEF_DOUBLE DEF_CHAR DEF_BOOL INT DOUBLE CHAR BOOL VAR EQ END CR

%%

	line_list: line
			 | line_list line
			 ;
			 
		 line: define CR  {printf("variable assignment success \n");}
		 
	   define: DEF_INT VAR END
			 | DEF_DOUBLE VAR END
			 | DEF_CHAR VAR END
			 | DEF_INT VAR EQ INT END
			 | DEF_INT VAR EQ CHAR END
			 | DEF_DOUBLE VAR EQ DOUBLE END
			 | DEF_DOUBLE VAR EQ INT END
			 | DEF_CHAR VAR EQ CHAR END
			 | DEF_CHAR VAR EQ INT END
			 | DEF_BOOL VAR EQ BOOL END

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
