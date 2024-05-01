#pragma once

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include <iostream>
#include <sstream>
#include <map>
#include <vector>
using namespace std;

/// @defgroup main main
/// @brief `main()`
/// @{

/// @brief program entry point
/// @param argc in number of cmdline arguments
/// @param argv in cmdline arguments
/// @return errorlevel code: 0 = ok
extern int main(int argc, char *argv[]);

/// @brief print single cmdline argument
/// @param argc in argv[index]
/// @param argv in argument value
extern void arg(int argc, char *argv);

/// @}

/// @defgroup core core
/// @brief object core runtime
/// @{

class Object {
    string V;
    Object(string V);
    virtual ~Object();
};

/// @}

/// @defgroup skelex skelex
/// @brief syntax parser
/// @{

extern int yylex();               ///< return token
extern int yylineno;              ///< current line number
extern char *yytext;              ///< current lexed token value
extern FILE *yyin;                ///< input file handler
extern char *yyfile;              ///< current file name
extern char *nofile;              ///< file name for @ref REPL
extern int yyparse();             ///< parser loop
extern void yyerror(string msg);  ///< syntax error callbaek
// #include "oF.lexer.hpp"
#include "oF.parser.hpp"
/// @}
