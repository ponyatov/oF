cd oF
git init
dirs = [ . .vscode bin doc lib src tmp ]
for i in dirs:
    mkdir -p i
    '!.gitignore' >> i/.gitignore

giti = [ __pycache__ ]
def i/(.gitignore): giti >> i/arg
def >>('!.gitignore'): pass

files = [ Makefile README.md apt.txt .clang-format doxy.gen ]
for j in files:
    touch j

vscode = [ settings tasks extensions ]
for k in vscode:;
    touch '.vscode/{k}.json'

def mkdir('bin') : mkdir arg ; ins '*' >> arg/.gitignore
def mkdir('tmp') : mkdir arg ; ins '*' >> arg/.gitignore
def mkdir('doc') : mkdir arg ; ins '*.{pdf,djvu}' >> arg/.gitignore

def multi(key,cmd):
    {
        "command": "multiCommand.{key}",
        "sequence": [
            "workbench.action.files.saveAll",
            {"command": "workbench.action.terminal.sendSequence",
                "args": {"text": "\u000D clear ; LANG=C make {cmd} \u000D"}}
        ]
    },

multi = 'multiCommand.commands': [ multi(f11,meta) multi(f12,all) ],

ignore = "**/{docs,giti}/**": true
exclude = 'files.%': { ignore '"**/{p}/**": true,' },
watcher = 'files.%': { ignore },
assoc   = 'files.%': { "*.f" : "ini" },

files = Sec // exclude // watcher // assoc

editor = {}

msys = {}

settings // { multi, files, editor, msys }
