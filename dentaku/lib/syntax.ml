type op_t = Minus | Times

type t = Num of int (* 整数 *)
       | Op of t * op_t * t (* 二項演算 *)

let rec string_of_expr expr = match expr with
    Num n -> string_of_int n
  | Op (e1, op, e2) ->
    let op_str = match op with
      | Minus -> "-"
      | Times -> "*"
    in
    "(" ^ string_of_expr e1 ^ op_str ^ string_of_expr e2 ^ ")"

let print expr =
  let str = string_of_expr expr
  in print_string str
