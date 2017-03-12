%{
	#include <stdio.h>

	#define T_DATA_DIRECTIVE 100
	#define T_BYTE_DIRECTIVE 101
	#define T_HALF_DIRECTIVE 102
	#define T_WORD_DIRECTIVE 103
	#define T_TEXT_DIRECTIVE 104
	#define T_GLOBL_DIRECTIVE 105
	#define T_END_DIRECTIVE 106

	#define T_REG 107
	#define T_ADD 108
	#define T_SUB 109
	#define T_LOAD_WORD 110
	#define T_LOAD_IMMEDIATE 111
	#define T_STORE_WORD 112
	#define T_ID 113
	#define T_INT_NUM 114

	#define COLON 115
	#define COMMA 116
	#define WS 117

%}

id 		[a-zA-Z][a-zA-Z0-9]*
number		[0-9]+
ws		[ \t\n]+

%%

".data"		{ printf("T_DATA_DIRECTIVE \n"); return T_DATA_DIRECTIVE;}
".byte"		{ printf("T_BYTE_DIRECTIVE \n"); return T_BYTE_DIRECTIVE;}
".half"		{ printf("T_HALF_DIRECTIVE \n"); return T_HALF_DIRECTIVE;}
".word"		{ printf("T_WORD_DIRECTIVE \n"); return T_WORD_DIRECTIVE;}
".text"		{ printf("T_TEXT_DIRECTIVE \n"); return T_TEXT_DIRECTIVE;}
".globl"	{ printf("T_GLOBL_DIRECTIVE \n"); return T_GLOBL_DIRECTIVE;}
".end"		{ printf("T_END_DIRECTIVE \n"); return T_END_DIRECTIVE;}

"$zero"		{ printf("T_REG : reg_no = 0 \n"); return T_REG;}
"$at"		{ printf("T_REG : reg_no = 1 \n"); return T_REG;}
"$v0"		{ printf("T_REG : reg_no = 2 \n"); return T_REG;}
"$v1"		{ printf("T_REG : reg_no = 3 \n"); return T_REG;}

"$a0"		{ printf("T_REG : reg_no = 4 \n"); return T_REG;}
"$a1"		{ printf("T_REG : reg_no = 5 \n"); return T_REG;}
"$a2"		{ printf("T_REG : reg_no = 6 \n"); return T_REG;}
"$a3"		{ printf("T_REG : reg_no = 7 \n"); return T_REG;}

"$t0"		{ printf("T_REG : reg_no = 8 \n"); return T_REG;}
"$t1"		{ printf("T_REG : reg_no = 9 \n"); return T_REG;}
"$t2"		{ printf("T_REG : reg_no = 10 \n"); return T_REG;}
"$t3"		{ printf("T_REG : reg_no = 11 \n"); return T_REG;}
"$t4"		{ printf("T_REG : reg_no = 12 \n"); return T_REG;}
"$t5"		{ printf("T_REG : reg_no = 13 \n"); return T_REG;}
"$t6"		{ printf("T_REG : reg_no = 14 \n"); return T_REG;}
"$t7"		{ printf("T_REG : reg_no = 15 \n"); return T_REG;}

"$s0"		{ printf("T_REG : reg_no = 16 \n"); return T_REG;}
"$s1"		{ printf("T_REG : reg_no = 17 \n"); return T_REG;}
"$s2"		{ printf("T_REG : reg_no = 18 \n"); return T_REG;}
"$s3"		{ printf("T_REG : reg_no = 19 \n"); return T_REG;}
"$s4"		{ printf("T_REG : reg_no = 20 \n"); return T_REG;}
"$s5"		{ printf("T_REG : reg_no = 21 \n"); return T_REG;}
"$s6"		{ printf("T_REG : reg_no = 22 \n"); return T_REG;}
"$s7"		{ printf("T_REG : reg_no = 23 \n"); return T_REG;}

"$t8"		{ printf("T_REG : reg_no = 24 \n"); return T_REG;}
"$t9"		{ printf("T_REG : reg_no = 25 \n"); return T_REG;}

"$k0"		{ printf("T_REG : reg_no = 26 \n"); return T_REG;}
"$k1"		{ printf("T_REG : reg_no = 27 \n"); return T_REG;}

"$gp"		{ printf("T_REG : reg_no = 28 \n"); return T_REG;}
"$sp"		{ printf("T_REG : reg_no = 29 \n"); return T_REG;}
"$fp"		{ printf("T_REG : reg_no = 30 \n"); return T_REG;}
"$ra"		{ printf("T_REG : reg_no = 31 \n"); return T_REG;}

"add"		{ printf("T_ADD \n"); return T_ADD;}
"sub"		{ printf("T_SUB \n"); return T_SUB;}

"li"		{ printf("T_LOAD_IMMEDIATE \n"); return T_LOAD_IMMEDIATE;}
"lw"		{ printf("T_LOAD_WORD \n"); return T_LOAD_WORD;}
"sw"		{ printf("T_STORE_WORD \n"); return T_STORE_WORD;}

{id} 		{ printf("T_ID : %s \n", yytext); return T_ID;}
{number}	{ printf("T_INT_NUM : %s \n", yytext); return T_INT_NUM;}
{ws}		{ return WS;}

":"		{ printf("COLON \n"); return COLON;}
","		{ printf("COMMA \n"); return COMMA;}


%%

int yywrap()
{
	return 1;
}

int main()
{
	int tok;
	while((tok = yylex()) != EOF)
	{
		switch(tok)
		{
			case T_REG: break;
			case T_ID: break;
		}
	}
}
