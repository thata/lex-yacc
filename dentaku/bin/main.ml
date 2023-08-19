let () =
  let buff = Lexing.from_channel stdin in
  let expr = Dentaku.Parser.start Dentaku.Lexer.token buff in
  let result = Dentaku.Eval.f expr in
  print_int result;
  print_newline ()
