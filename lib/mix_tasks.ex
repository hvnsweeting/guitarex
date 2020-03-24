defmodule Mix.Tasks.Chord do
  use Mix.Task

  @impl Mix.Task
  @shortdoc """
  Show frets with notes in given chord
  """
  def run(args) do
    case args do
      [symbol] ->
        symbol = String.upcase(symbol)

        {note, type} =
          if String.ends_with?(symbol, "M") do
            {String.at(symbol, 0), :minor}
          else
            {symbol, :major}
          end

        Guitarex.chord_frets(note, type)

      _ ->
        IO.puts("chord name is required, e.g: C or Am")
    end
  end
end

defmodule Mix.Tasks.Frets do
  use Mix.Task

  @impl Mix.Task
  @shortdoc """
  Show frets with all notes
  """
  def run(_args) do
    Guitarex.main()
  end
end
