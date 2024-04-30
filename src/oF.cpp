#include "oF.hpp"

int main(int argc, char *argv[]) {  //
    arg(0, argv[0]);
    for (int i = 1; i < argc; i++) {  //
        arg(i, argv[i]);
    }
    return 0;
}

void arg(int argc, char *argv) {  //
    cerr << "argv[" << argc << "] = <" << argv << ">" << endl;
}

#define YYERR "\n\n" << yylineno << ":" << msg << "[" << yytext << "]\n\n"
extern void yyerror(string msg) {
    cerr << YYERR;
    exit(-1);
}
