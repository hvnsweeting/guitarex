defmodule GuitarexTest do
  use ExUnit.Case
  doctest Guitarex

  test "No G# but Ab" do
    assert Guitarex.next("G") == "Ab"
  end

  test "A after 1 steps is A#" do
    assert Guitarex.up("A", 1) == "A#"
  end

  test "A after 2 steps is B" do
    assert Guitarex.up("A", 2) == "B"
  end

  test "E after 1 steps is F" do
    assert Guitarex.up("E", 1) == "F"
  end

  test "Chord C consists of C E G" do
    assert Guitarex.chord("C", :major) == MapSet.new(["C", "E", "G"])
  end

  test "Chord Am consists of A C E" do
    assert Guitarex.chord("A", :minor) == MapSet.new(["A", "C", "E"])
  end
end
