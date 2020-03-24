defmodule Guitarex do
  @moduledoc """
  Documentation for `Guitarex`.
  """

  def chord(base, :major) do
    MapSet.new([base, up(base, 4), up(base, 7)])
  end

  def chord(base, :minor) do
    MapSet.new([base, up(base, 3), up(base, 7)])
  end

  def chord_frets(base, type) do
    notes_in_chord = chord(base, type)

    guitar_strings()
    |> Enum.map(fn xs ->
      Enum.map(xs, fn c ->
        if MapSet.member?(notes_in_chord, c) do
          c
        else
          " "
        end
      end)
    end)
    |> Enum.reverse()
    |> display_frets
  end

  @doc """
  Display a guitar with all nodes
  """
  def main do
    guitar_strings()
    |> Enum.reverse()
    |> display_frets
  end

  def guitar_strings() do
    ["E", "A", "D", "G", "B", "E"]
    |> Enum.map(fn base -> build_string(base) end)
  end

  def display_frets(strings) do
    counter_bar = Enum.to_list(0..12) |> Enum.map(fn x -> Integer.to_string(x) end)

    (strings ++ [counter_bar])
    |> Enum.map(&format_notes(&1))
    |> Enum.each(&IO.inspect/1)
  end

  def format_notes(xs) do
    xs
    |> Enum.map(fn x -> String.pad_trailing(x, 2) end)
    |> Enum.join(" | ")
  end

  def build_string(base) do
    0..12
    |> Enum.map(fn s -> up(base, s) end)
  end

  def up(note, 0) do
    note
  end

  def up(note, steps) do
    up(next(note), steps - 1)
  end

  def next("A") do
    "A#"
  end

  def next("A#") do
    "B"
  end

  def next("B") do
    "C"
  end

  def next("C") do
    "C#"
  end

  def next("C#") do
    "D"
  end

  def next("D") do
    "D#"
  end

  def next("D#") do
    "E"
  end

  def next("E") do
    "F"
  end

  def next("F") do
    "F#"
  end

  def next("F#") do
    "G"
  end

  def next("G") do
    "Ab"
  end

  def next("Ab") do
    "A"
  end
end
