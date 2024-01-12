- `PROGRAM -> FUNC_DECL STMTS`  
  The program starts with a function declaration followed by other statements.

- `STMTS -> STMT STMTS | ε`  
  A sequence of statements, which can also be empty (ε represents an empty string).

- `STMT -> DECL | ASSIGN | PRINT | SCAN | IF | WHILE | DOWHILE | BREAK | CONTINUE | FUNC_DECL | FUNC_CALL | ε`  
  A statement can be a declaration, assignment, print, scan, if, while, do-while, break, continue, function declaration, function call, or empty.

- `DECL -> TYPE id ; | TYPE id = EXPR ; | TYPE [ ] id = { EXPRS } ;`  
  A declaration can be a simple type declaration, type declaration with assignment, or an array declaration with assignment.

- `TYPE -> int | bool | double | char | string`  
  The types available in the language.

- `ASSIGN -> id = EXPR ; | id [ EXPR ] = EXPR ;`  
  An assignment can be a simple assignment or an array assignment.

- `EXPR -> EXPR OP EXPR | ( EXPR ) | id | num | bool_val | char_val | string_val | id [ EXPR ]`  
  An expression can be a binary operation, a parenthesized expression, an identifier, a number, a boolean value, a character value, a string value, or an array access.

- `OP -> + | - | * | / | > | >= | < | <= | == | != | && | ||`  
  The operators available in the language.

- `PRINT -> tea id ;`  
  Print statement.

- `SCAN -> TYPE id snatch ;`  
  Scan statement.

- `IF -> iykyk ( EXPR ) finna BLOCK slay | iykyk ( EXPR ) finna BLOCK slay jkUnless ( EXPR ) finna BLOCK slay | iykyk ( EXPR ) finna BLOCK slay perchance finna BLOCK slay`  
  If statement with optional else-if and else parts.

- `BLOCK -> { STMTS }`  
  A block of statements.

- `WHILE -> while ( EXPR ) finna BLOCK slay`  
  While statement.

- `DOWHILE -> chill finna BLOCK slay while ( EXPR ) ;`  
  Do-while statement.

- `BREAK -> skrt ;`  
  Break statement.

- `CONTINUE -> letHimCook ;`  
  Continue statement.

- `FUNC_DECL -> fr TYPE id ( PARAMS ) finna BLOCK slay`  
  Function declaration.

- `PARAMS -> TYPE id , PARAMS | TYPE id | ε`  
  Function parameters, which can be multiple parameters, a single parameter, or no parameters.

- `FUNC_CALL -> id ( ARGS ) ;`  
  Function call.

- `ARGS -> EXPR , ARGS | EXPR | ε`  
  Function arguments, which can be multiple arguments, a single argument, or no arguments.

- `EXPRS -> EXPR , EXPRS | EXPR`  
  Expressions for array declaration, which can be multiple expressions or a single expression.
