defmodule Ytgl.CLI do
  alias Ytgl.{Lexer}

  @moduledoc """
  Ytgl is a small slang language that can be lexxed.

  To compile and run a file:

    call "./ytgl nameOfFile.dw"
    then "./nameOfFile.s"
  """

  @spec main(list()) :: any()
  @doc """
    Compiles the file passed in the args or prints a help menu.

  """
  def main(args) do
    case args do
      [] ->
        print_help_menu()

      [file_path | _rest] ->
        compile_file(file_path)
    end
  end

  defp compile_file(file_path) do
    {:ok, source} = File.read(file_path)

    source
    # turns the source programs into a list of tokens
    |> tokenize_and_inspect()
  end

  defp tokenize_and_inspect(source) do
    source
    |> Lexer.tokenize()
    |> (fn tokens ->
        IO.puts("Tokenized representation:")
        tokens
      end).()
    |> IO.inspect(limit: :infinity)
  end

  defp print_help_menu do
    IO.puts """
    Usage: ./ytgl <filename.ytg>

    Ytgl is a small slang language that can be lexxed.

    Examples:
      To compile and run a file:
        ./ytgl nameOfFile.ytg
    """
  end
end
