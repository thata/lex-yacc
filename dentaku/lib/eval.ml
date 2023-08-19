let rec f expr =
  match expr with
  | Syntax.Num n -> n
  | Syntax.Op (e1, op, e2) -> (
      let v1 = f e1 in
      let v2 = f e2 in
      match op with Syntax.Minus -> v1 - v2 | Syntax.Times -> v1 * v2)
