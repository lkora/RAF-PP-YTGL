defmodule Ytgl.CLI do
  alias Ytgl.{Lexer}

  @moduledoc """
  Ytgl is a small slang language that can be lexxed.

  To compile and run a file :

                                call "./ytgl nameOfFile.dw"
                                then "./nameOfFile.s"
  """

  @spec main(list()) :: any()
  @doc """
    Compiles the file passed in the args.

  """
  def main(args \\ []) do
    {:ok, source} = File.read(List.first(args))

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
end
