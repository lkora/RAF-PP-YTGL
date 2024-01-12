PROGRAM' -> PROGRAM
PROGRAM -> FUNC_DECL STMTS
STMTS -> STMT STMTS
STMTS -> ε
STMT -> DECL
STMT -> ASSIGN
STMT -> PRINT
STMT -> SCAN
STMT -> IF
STMT -> WHILE
STMT -> DOWHILE
STMT -> BREAK
STMT -> CONTINUE
STMT -> FUNC_DECL
STMT -> FUNC_CALL
STMT -> ε
DECL -> TYPE id ;
DECL -> TYPE id = EXPR ;
DECL -> TYPE [ ] id = { EXPRS } ;
TYPE -> int
TYPE -> bool
TYPE -> double
TYPE -> char
TYPE -> string
ASSIGN -> id = EXPR ;
ASSIGN -> id [ EXPR ] = EXPR ;
EXPR -> EXPR OP EXPR
EXPR -> ( EXPR )
EXPR -> id
EXPR -> num
EXPR -> bool_val
EXPR -> char_val
EXPR -> string_val
EXPR -> id [ EXPR ]
OP -> +
OP -> -
OP -> *
OP -> /
OP -> >
OP -> >=
OP -> <
OP -> <=
OP -> ==
OP -> !=
OP -> &&
OP -> ||
PRINT -> tea id ;
SCAN -> TYPE id snatch ;
IF -> iykyk ( EXPR ) finna BLOCK slay
IF -> iykyk ( EXPR ) finna BLOCK slay jkUnless ( EXPR ) finna BLOCK slay
IF -> iykyk ( EXPR ) finna BLOCK slay perchance finna BLOCK slay
BLOCK -> { STMTS }
WHILE -> while ( EXPR ) finna BLOCK slay
DOWHILE -> chill finna BLOCK slay while ( EXPR ) ;
BREAK -> skrt ;
CONTINUE -> letHimCook ;
FUNC_DECL -> fr TYPE id ( PARAMS ) finna BLOCK slay
PARAMS -> TYPE id , PARAMS
PARAMS -> TYPE id
PARAMS -> ε
FUNC_CALL -> id ( ARGS ) ;
ARGS -> EXPR , ARGS
ARGS -> EXPR
ARGS -> ε
EXPRS -> EXPR , EXPRS
EXPRS -> EXPR
