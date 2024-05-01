%{
    #include "oF.hpp"
    #include "oF.lexer.hpp"
%}

%defines %union { Object *o; }

%token<o> cmd
%type<o>  ex

%%
syntax : | syntax ex { cout << $2 << endl; }
ex     :          cmd
