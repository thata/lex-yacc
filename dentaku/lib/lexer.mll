{
    (* 補助的な変数、関数、型などを定義 *)
}

(* 正規表現の略記 *)
let space = [' ' '\t' '\n' '\r']
let digit = ['0'-'9']

(* 字句解析の規則 *)
rule token = parse
    space+ { token lexbuf } (* 空白は読み飛ばす *)
  | "(*" [^'\n']* "\n" { token lexbuf } (* コメントは読み飛ばす *)
  | digit+ { ("NUMBER", Lexing.lexeme lexbuf) }
  | "(" { ("LPAREN", Lexing.lexeme lexbuf) }
  | ")" { ("RPAREN", Lexing.lexeme lexbuf) }
  | "-" { ("MINUS", Lexing.lexeme lexbuf) }
  | "*" { ("TIMES", Lexing.lexeme lexbuf) }
  | eof { ("EOF", "") }
  | _ { failwith "unknown token" }
