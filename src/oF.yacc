/// @file
/// @brief parser
%{
    #include "oF.hpp"
    #include "oF.lexer.hpp"
    char *nofile = "";
    char *yyfile = nofile;
%}

%defines %union { Object *o; }

%token<o> cmd
%type<o>  ex

%%
syntax : | syntax ex { cout << $2->dump() << endl; }
ex     :          cmd
