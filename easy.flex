/*
	CS 155 Problem Set 2 - Lexical Analyzer using Flex

	Created by:
	CHOA, John Miguel C.
	2019-00022
	CS 155 LEC 1
	CS 155 LAB 2

	Usage:
		(1) $ flex easy.flex
		(2) $ gcc lex.yy.c
		(3a on Windows) a.exe <test_file.easy>
		(3b on Linux / Mac) $ ./a.out <test_file.easy> 
*/

%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>
int lineno = 1;
void ret_print(char *token_type);
void yyerror();
%}

NEWLINE				\n
SEMICOLON			;
COMMENT				\/\/.*
PROCEDURE			procedure
STOP				stop
RETURN				return
CALL				call
COMMA				,
SBRACKET_CLOSE		\]
SBRACKET_OPEN		\[
PARENTHESIS_CLOSE	\)
PARENTHESIS_OPEN	\(
ARRAY				array
OUTPUT				output
INPUT				input
ENDFOR				endfor
BY					by
FOREVER				forever
FOR					for
LOOP				loop
UNTIL				until
REPEAT				repeat
ENDWHILE			endwhile
DO					do
WHILE				while
ELSEIF				"else if"
COLON				:
ENDCASE				endcase
END					end
CASE				case
ELSE				else
THEN				then
IF					if
EXIT				exit
GOTO				"go to"
TO					to
LOGARITHM2			log_2
LOGARITHM			log
MODULO				mod
RELATIONAL_OP		<|<=|==|!=|>|>=
GETS				=
LOGICAL_OP			and|or|not
ARITHMETIC_OP		[+\-*/^]
BOOLEAN				true|false
STRING				'[^']*'
NUMBER				[0-9]+
IDENTIFIER			[A-Za-z_][A-Za-z0-9_]*

%%

{NEWLINE}			{ ret_print("NEWLINE"); lineno++;}
{SEMICOLON}			{ ret_print("SEMICOLON"); }
{COMMENT}			{ ret_print("COMMENT"); }
{PROCEDURE}			{ ret_print("PROCEDURE"); }
{STOP}				{ ret_print("STOP"); }
{RETURN}			{ ret_print("RETURN"); }
{CALL}				{ ret_print("CALL"); }
{COMMA}				{ ret_print("COMMA"); }
{SBRACKET_CLOSE}	{ ret_print("SBRACKET_CLOSE"); }
{SBRACKET_OPEN}		{ ret_print("SBRACKET_OPEN"); }
{PARENTHESIS_CLOSE}	{ ret_print("PARENTHESIS_CLOSE"); }
{PARENTHESIS_OPEN}	{ ret_print("PARENTHESIS_OPEN"); }
{ARRAY}				{ ret_print("ARRAY"); }
{OUTPUT}			{ ret_print("OUTPUT"); }
{INPUT}				{ ret_print("INPUT"); }
{ENDFOR}			{ ret_print("ENDFOR"); }
{BY}				{ ret_print("BY"); }
{FOREVER}			{ ret_print("FOREVER"); }
{FOR}				{ ret_print("FOR"); }
{LOOP}				{ ret_print("LOOP"); }
{UNTIL}				{ ret_print("UNTIL"); }
{REPEAT}			{ ret_print("REPEAT"); }
{ENDWHILE}			{ ret_print("ENDWHILE"); }
{DO}				{ ret_print("DO"); }
{WHILE}				{ ret_print("WHILE"); }
{ELSEIF}			{ ret_print("ELSEIF"); }
{COLON}				{ ret_print("COLON"); }
{ENDCASE}			{ ret_print("ENDCASE"); }
{END}				{ ret_print("END"); }
{CASE}				{ ret_print("CASE"); }
{ELSE}				{ ret_print("ELSE"); }
{THEN}				{ ret_print("THEN"); }
{IF}				{ ret_print("IF"); }
{EXIT}				{ ret_print("EXIT"); }
{GOTO}				{ ret_print("GOTO"); }
{TO}				{ ret_print("TO"); }
{LOGARITHM2}		{ ret_print("LOGARITHM2"); }
{LOGARITHM}			{ ret_print("LOGARITHM"); }
{MODULO}			{ ret_print("MODULO"); }
{RELATIONAL_OP}		{ ret_print("RELATIONAL_OP"); }
{GETS}				{ ret_print("GETS"); }
{LOGICAL_OP}		{ ret_print("LOGICAL_OP"); }
{ARITHMETIC_OP}		{ ret_print("ARITHMETIC_OP"); }
{BOOLEAN}			{ ret_print("BOOLEAN"); }
{STRING}			{ ret_print("STRING"); }
{NUMBER}			{ ret_print("NUMBER"); }
{IDENTIFIER}		{ ret_print("IDENTIFIER"); }
[ \t\r\f]+			/* eat up whitespace */
.					{ yyerror("Unrecognized character");}

%%

void ret_print(char *token_type){
	printf("yytext: %s\ttoken: %s\tlineno: %d\n", yytext, token_type, lineno);
}

void yyerror(char *message){
	printf("Error: \"%s\" in line %d, Token = %s\n", message, lineno, yytext);
	exit(1);
}

int main(int argc, char *argv[]){
	yyin = fopen(argv[1], "r");
	yylex();
	fclose(yyin);
	return 0;
}