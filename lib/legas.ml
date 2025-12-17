let app = Sys.getcwd () |> String.split_on_char '/' |> List.rev |> List.hd
let title = "0F: zero FORTH in OCaml"
let about = "tiny REPL & compiler"
let author = "Dmitry Ponyatov"
let email = "dponyatov@gmail.com"
let year = 2025
let version = "0.0.1"
let license = "MIT"
let github = "github: https://github.com/ponyatov/" ^ app

#use "legas/files.ml"
dirs();