%{
/// @file
/// @brief lexer

    #include "oF.hpp"
%}

%option noyywrap yylineno

%%
#.*        {}             /// line comment
[ \t\r\n]+ {}             /// drop any spaces
.          {yyerror("");} /// any undefined char
