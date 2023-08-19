%{
  (* 補助的な変数、関数、型などの定義 *)
%}

%token LPAREN RPAREN
%token MINUS TIMES
%token <int> NUMBER
%token EOF

// エントリーポイントの定義
%start start

// 非終端記号の型をここで宣言する
%type <Syntax.t> start

// 演算子の優先順位を指定する
// 下に行くほど優先順位が高い
%left MINUS
%left TIMES
%nonassoc UNARY

// 文法規則の定義
%%
start:
| expr EOF { $1 }

simple_expr:
| NUMBER { Syntax.Num($1) }
| LPAREN expr RPAREN { $2 }

expr:
| simple_expr { $1 }
| expr MINUS expr { Syntax.Op($1, Syntax.Minus, $3) }
| expr TIMES expr { Syntax.Op($1, Syntax.Times, $3) }
| MINUS expr %prec UNARY { Syntax.Op(Syntax.Num(0), Syntax.Minus, $2) }

