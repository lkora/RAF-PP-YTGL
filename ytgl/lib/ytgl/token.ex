defmodule Ytgl.Token do
  @moduledoc """
    The Token is the smallest respresentation of a lexxed string literal.
    It is given in the form [:type, :literal]

  """

  @enforce_keys [:type, :literal]
  defstruct [:type, :literal]


  @keywords %{
    # Data Types
    "int" => :int,
    "bool" => :bool,
    "double" => :double,
    "char" => :char,
    "string" => :string,

    # Values
    "noCap" => true,
    "onGod" => true,
    "cap" => false,

    # Scope
    "finna" => :begin_block,
    "slay" => :end_block,

    # if - else if - else
    "iykyk" => :if,
    "jkUnless" => :elseif,
    "perchance" => :else,

    # Loop statements
    "while" => :while,
    "vibe" => :do_while,
    "for" => :for,

    # Functions
    "fr" => :function,
    "itsGiving" => :return,
    "nah" => :null,

    #Flow
    "skrt" => :break,
    "letHimCook" => :continue
  }

  @types %{
      illegal: "ILLEGAL",
      eof: "EOF",

      # Identifiers and literals
      ident: "IDENT",
      int: "INT",
      bool: "BOOL",
      double: "DOUBLE",
      char: "CHAR",
      string: "STRING",

      # Operators
        # Assignment
        assign: "=",

         # Arithmetical
        plus: "+",
        minus: "-",
        asterisk: "*",
        slash: "/",
        mod: "%",

        # Relational
        lt: "<",
        lte: "<=",
        gt: ">",
        gte: ">=",
        eq: "==",
        not_eq: "!=",

        # Logical
        logical_and: "&&",
        logical_or: "||",
        logical_not: "!",

      # Delimiters
      comma: ",",
      semicolon: ",",
      colon: ":",
      lparen: "(",
      rparen: ")",
      lbracket: "[",
      rbracket: "]",

      # Keywords
      function: "FUNCTION",
      true: "TRUE",
      false: "FALSE",

      if: "IF",
      else_if: "ELSE_IF",
      else: "ELSE",

      while: "WHILE",
      vibe: "DO_WHILE",
      for: "FOR",

      return: "RETURN",
      null: "NULL",
      begin_block: "BEGIN_BLOCK",
      end_block: "END_BLOCK",
      break: "BREAK",
      continue: "CONTINUE",
      array: "ARRAY"
  }


  @doc """
  Creates a new token with the specified type and literal value.

  This function is used to create a new token. It takes a list of key-value pairs representing the token's type and literal value. The `type` should be one of the defined token types, and `literal` should be a binary. If the `type` is valid and corresponds to a known token type, a `%Ytgl.Token` struct is returned with the specified `type` and `literal`. If the `type` is not a valid token type, an exception is raised indicating that the token type is not defined.

  ## Parameters

  - `type` (atom): The token type, such as `:function`, `:let`, or any other valid type.
  - `literal` (binary): The literal value associated with the token.

  ## Examples

      iex> Ytgl.Token.new(type: :function, literal: "fn")
      %Ytgl.Token{type: :function, literal: "fn"}

      iex> Ytgl.Token.new(type: :ident, literal: "my_variable")
      %Ytgl.Token{type: :ident, literal: "my_variable"}


  """
  @spec new([{:literal, binary()} | {:type, atom()}, ...]) :: %Ytgl.Token{
          literal: binary(),
          type: atom()
        }
  def new(type: type, literal: literal) when is_atom(type) and is_binary(literal) do
    if Map.has_key?(@types, type) do
      %__MODULE__{type: type, literal: literal}
    else
      raise "Token with type #{inspect(type)} is not defined"
    end
  end


  @doc """
  Looks up the token type for an identifier.

  This function is used to determine the token type for an identifier, such as a variable or a function name. It checks if the provided `ident` is a known keyword, and if so, returns the corresponding token type. If `ident` is not a keyword, it returns `:ident` to indicate an identifier.

  ## Examples

      iex> Ytgl.Token.lookup_ident("if")
      :if

      iex> Ytgl.Token.lookup_ident("my_variable")
      :ident

  ## Raises

    - RuntimeError: If the provided type is not a valid token type.
  """
  @spec lookup_ident(any()) :: any()
  def lookup_ident(ident) do
    Map.get(@keywords, ident, :ident)
  end
end
