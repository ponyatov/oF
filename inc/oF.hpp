#pragma once

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include <iostream>
#include <sstream>
#include <map>
#include <vector>
using namespace std;

extern int main(int argc, char *argv[]);
extern void arg(int argc, char *argv);

extern int yylex();
extern int yylineno;
extern char *yytext;
extern int yyparse();
extern void yyerror(string msg);
// #include "oF.lexer.hpp"
#include "oF.parser.hpp"
