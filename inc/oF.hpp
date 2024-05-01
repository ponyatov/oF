#pragma once

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include <dlfcn.h>

#include <iostream>
#include <sstream>
#include <map>
#include <vector>
using namespace std;

/// @defgroup main main
/// @brief `main()`

/// @brief program entry point
/// @param argc in number of cmdline arguments
/// @param argv in cmdline arguments
/// @return errorlevel code: 0 = ok
/// @ingroup main
extern int main(int argc, char *argv[]);

/// @brief print single cmdline argument
/// @param argc in argv[index]
/// @param argv in argument value
/// @ingroup main
extern void arg(int argc, char *argv);

/// @defgroup core core
/// @brief object core runtime

/// @brief root class
/// @ingroup core
class Object {
    string value;  ///< scalar value: object name, string, number
   public:
    /// @name constructor
    Object(string V);  ///< constructor
    ~Object();         ///< reftree-based destructor
    /// @name dump/stringify
    virtual string tag();        ///< `<T:` type/class tag
    virtual string val();        ///< `:V>` object value as string
    string head();               ///< `<T:V>` object header
    string dump(int depth = 0);  ///< full text-tree dump
};

/// @defgroup exec exec
/// @brief EDS: executable data structure (c)
/// @ingroup core

/// @brief executable objects
/// @ingroup exec
class Exec : public Object {
   public:
    Exec(string V);
};

/// @defgroup vm vm
/// @brief Virtual FORTH Machine
/// @ingroup exec

/// @brief Virtual Machine
/// @ingroup vm
class VM : public Exec {};

/// @brief VM command
/// @ingroup vm
class Cmd : public Exec {
    void (*fn)();  /// pointer to implementing function
    string name(void (*F)());

   public:
    Cmd(void (*F)());
};

/// @ingroup vm
/// @{
extern void nop();  ///< `( -- )` empty command
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
