%{
/// @file
/// @brief lexer

    #include "oF.hpp"
%}

%option noyywrap yylineno

%%
#.*        {}             /// line comment
[ \t\r\n]+ {}             /// drop any spaces

nop        {yylval.o = new Cmd(nop); return cmd;}

.          {yyerror("");} /// any undefined char
