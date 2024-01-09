defmodule Ytgl.LexerTest do
  use ExUnit.Case

  alias Ytgl.Token

  test "converts a string into a list of tokens" do
    input = "=+(),;"

    expected = [
      %Token{type: :assign, literal: "="},
      %Token{type: :plus, literal: "+"},
      %Token{type: :lparen, literal: "("},
      %Token{type: :rparen, literal: ")"},
      %Token{type: :comma, literal: ","},
      %Token{type: :semicolon, literal: ";"},
      %Token{type: :eof, literal: ""}
    ]

    tokens = Ytgl.Lexer.tokenize(input)

    IO.inspect(tokens)

    assert_tokens_match_length(tokens, expected)

  end

  test "converts a fibonacci function into a list of tokens" do
    input = """
    fr int fibonacci(int n) finna
        iykyk n <= 1 finna
            itsGiving n;
        slay perchance finna
            itsGiving fibonacci(n - 1) + fibonacci(n - 2);
        slay
    slay

    """

    expected = [
      %Token{type: :function, literal: "fr"},
      %Token{type: :int, literal: "int"},
      %Token{type: :ident, literal: "fibonacci"},
      %Token{type: :lparen, literal: "("},
      %Token{type: :int, literal: "int"},
      %Token{type: :ident, literal: "n"},
      %Token{type: :rparen, literal: ")"},
      %Token{type: :begin_block, literal: "finna"},
      %Token{type: :if, literal: "iykyk"},
      %Token{type: :ident, literal: "n"},
      %Token{type: :lt, literal: "<"},
      %Token{type: :assign, literal: "="},
      %Token{type: :int, literal: "1"},
      %Token{type: :begin_block, literal: "finna"},
      %Token{type: :return, literal: "itsGiving"},
      %Token{type: :ident, literal: "n"},
      %Token{type: :semicolon, literal: ";"},
      %Token{type: :end_block, literal: "slay"},
      %Token{type: :else, literal: "perchance"},
      %Token{type: :begin_block, literal: "finna"},
      %Token{type: :return, literal: "itsGiving"},
      %Token{type: :ident, literal: "fibonacci"},
      %Token{type: :lparen, literal: "("},
      %Token{type: :ident, literal: "n"},
      %Token{type: :minus, literal: "-"},
      %Token{type: :int, literal: "1"},
      %Token{type: :rparen, literal: ")"},
      %Token{type: :plus, literal: "+"},
      %Token{type: :ident, literal: "fibonacci"},
      %Token{type: :lparen, literal: "("},
      %Token{type: :ident, literal: "n"},
      %Token{type: :minus, literal: "-"},
      %Token{type: :int, literal: "2"},
      %Token{type: :rparen, literal: ")"},
      %Token{type: :semicolon, literal: ";"},
      %Token{type: :end_block, literal: "slay"},
      %Token{type: :end_block, literal: "slay"},
      %Token{type: :eof, literal: ""}
    ]

    tokens = Ytgl.Lexer.tokenize(input)

    IO.inspect(tokens)

    assert_tokens_match_length(tokens, expected)

  end

  test "print a square of size with edges from + and - inside" do
    input = """
    fr nah printSquare(int size) finna
        int i = 0;
        int j = 0;
        while i < size finna
            j = 0;
            iykyk i == 0 || i == size - 1 finna
                while j < size finna
                    tea "+";
                    j = j + 1;
                slay
            slay perchance finna
                while j < size finna
                    iykyk j == 0 || j == size - 1 finna
                        tea "+";
                    slay perchance finna
                        tea "-";
                    slay
                    j = j + 1;
                slay
            slay
            tea "\n";
        slay
    slay
    """

    expected = [
      %Token{type: :function, literal: "fr"},
      %Token{type: :null, literal: "nah"},
      %Token{type: :ident, literal: "printSquare"},
      %Token{type: :lparen, literal: "("},
      %Token{type: :int, literal: "int"},
      %Token{type: :ident, literal: "size"},
      %Token{type: :rparen, literal: ")"},
      %Token{type: :begin_block, literal: "finna"},
      %Token{type: :int, literal: "int"},
      %Token{type: :ident, literal: "i"},
      %Token{type: :assign, literal: "="},
      %Token{type: :int, literal: "0"},
      %Token{type: :semicolon, literal: ";"},
      %Token{type: :int, literal: "int"},
      %Token{type: :ident, literal: "j"},
      %Token{type: :assign, literal: "="},
      %Token{type: :int, literal: "0"},
      %Token{type: :semicolon, literal: ";"},
      %Token{type: :while, literal: "while"},
      %Token{type: :ident, literal: "i"},
      %Token{type: :lt, literal: "<"},
      %Token{type: :ident, literal: "size"},
      %Token{type: :begin_block, literal: "finna"},
      %Token{type: :ident, literal: "j"},
      %Token{type: :assign, literal: "="},
      %Token{type: :int, literal: "0"},
      %Token{type: :semicolon, literal: ";"},
      %Token{type: :if, literal: "iykyk"},
      %Token{type: :ident, literal: "i"},
      %Token{type: :eq, literal: "=="},
      %Token{type: :int, literal: "0"},
      %Token{type: :logical_or, literal: "||"},
      %Token{type: :ident, literal: "i"},
      %Token{type: :eq, literal: "=="},
      %Token{type: :ident, literal: "size"},
      %Token{type: :minus, literal: "-"},
      %Token{type: :int, literal: "1"},
      %Token{type: :begin_block, literal: "finna"},
      %Token{type: :while, literal: "while"},
      %Token{type: :ident, literal: "j"},
      %Token{type: :lt, literal: "<"},
      %Token{type: :ident, literal: "size"},
      %Token{type: :begin_block, literal: "finna"},
      %Token{type: :ident, literal: "tea"},
      %Token{type: :string, literal: "+"},
      %Token{type: :semicolon, literal: ";"},
      %Token{type: :ident, literal: "j"},
      %Token{type: :assign, literal: "="},
      %Token{type: :ident, literal: "j"},
      %Token{type: :plus, literal: "+"},
      %Token{type: :int, literal: "1"},
      %Token{type: :semicolon, literal: ";"},
      %Token{type: :end_block, literal: "slay"},
      %Token{type: :end_block, literal: "slay"},
      %Token{type: :else, literal: "perchance"},
      %Token{type: :begin_block, literal: "finna"},
      %Token{type: :while, literal: "while"},
      %Token{type: :ident, literal: "j"},
      %Token{type: :lt, literal: "<"},
      %Token{type: :ident, literal: "size"},
      %Token{type: :begin_block, literal: "finna"},
      %Token{type: :if, literal: "iykyk"},
      %Token{type: :ident, literal: "j"},
      %Token{type: :eq, literal: "=="},
      %Token{type: :int, literal: "0"},
      %Token{type: :logical_or, literal: "||"},
      %Token{type: :ident, literal: "j"},
      %Token{type: :eq, literal: "=="},
      %Token{type: :ident, literal: "size"},
      %Token{type: :minus, literal: "-"},
      %Token{type: :int, literal: "1"},
      %Token{type: :begin_block, literal: "finna"},
      %Token{type: :ident, literal: "tea"},
      %Token{type: :string, literal: "+"},
      %Token{type: :semicolon, literal: ";"},
      %Token{type: :end_block, literal: "slay"},
      %Token{type: :else, literal: "perchance"},
      %Token{type: :begin_block, literal: "finna"},
      %Token{type: :ident, literal: "tea"},
      %Token{type: :string, literal: "-"},
      %Token{type: :semicolon, literal: ";"},
      %Token{type: :end_block, literal: "slay"},
      %Token{type: :ident, literal: "j"},
      %Token{type: :assign, literal: "="},
      %Token{type: :ident, literal: "j"},
      %Token{type: :plus, literal: "+"},
      %Token{type: :int, literal: "1"},
      %Token{type: :semicolon, literal: ";"},
      %Token{type: :end_block, literal: "slay"},
      %Token{type: :end_block, literal: "slay"},
      %Token{type: :ident, literal: "tea"},
      %Token{type: :string, literal: "\n"},
      %Token{type: :semicolon, literal: ";"},
      %Token{type: :end_block, literal: "slay"},
      %Token{type: :end_block, literal: "slay"},
      %Token{type: :eof, literal: ""}
    ]

    tokens = Ytgl.Lexer.tokenize(input)

    IO.inspect(tokens)

    assert_tokens_match_length(tokens, expected)

  end

  # Helper methods
  defp assert_tokens_match_length(tokens, expected) do
    assert length(tokens) == length(expected)

    Enum.zip(expected, tokens)
    |> Enum.each(&assert elem(&1, 0) == elem(&1, 1))
  end


end
