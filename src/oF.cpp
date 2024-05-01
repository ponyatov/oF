#include "oF.hpp"

int main(int argc, char *argv[]) {  //
    arg(0, argv[0]);
    for (int i = 1; i < argc; i++) {  //
        arg(i, argv[i]);
        yyfile = argv[i];
        assert(yyin = fopen(argv[i], "r"));
        yyparse();
        fclose(yyin);
        yyfile = nofile;
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

/// @ingroup core
/// @{

Object::Object(string V) { value = V; }
Object::~Object() {}

string Object::tag() { return "tag"; }
string Object::val() { return value; }

string Object::head() {
    ostringstream os;
    os << '<' << tag() << ':' << val() << '>';
    return os.str();
}

string Object::dump(int depth) {  //
    return this->head();
}

Exec::Exec(string V) : Object(V) {}

/// @}

/// @ingroup vm
/// @{

string Cmd::name(void (*F)()) {
    Dl_info info;
    return string("fn");
}

Cmd::Cmd(void (*F)()) : Exec(Cmd::name(F)) { fn = F; }

void nop() {}

/// @}
