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
  | digit+ { Parser.NUMBER(int_of_string(Lexing.lexeme lexbuf)) }
  | "(" { Parser.LPAREN }
  | ")" { Parser.RPAREN }
  | "-" { Parser.MINUS }
  | "*" { Parser.TIMES }
  | eof { Parser.EOF }
  | _ { failwith "unknown token" }
