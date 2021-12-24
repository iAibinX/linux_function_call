%{
	#include "y.tab.h"
	void yyerror(char *);
%}

FUNCNAME 	[a-zA-Z_$]+[a-zA-Z_$0-9]*

%%
{FUNCNAME}  return FUNCNAME;
"()"        return INPUT;
"int"		return DEF_INT;
"double"	return DEF_DOUBLE;
"char"		return DEF_CHAR;
"bool"		return DEF_BOOL;
"void"      return DEF_VOID;
"{"			return S;
"}"         return E;
";"			return END;
"\n"		return CR;
%%