if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("point_mutations.exs")
end

ExUnit.start trace: true

defmodule DNATest do
  use ExUnit.Case, async: true

  test "no difference between empty strands" do
    assert DNA.hamming_distance('', '') == 0
  end

  test "no difference between identical strands" do
    assert DNA.hamming_distance('GGACTGA', 'GGACTGA') == 0
  end

  test "small hamming distance in middle somewhere" do
    assert DNA.hamming_distance('GGACG', 'GGTCG') == 1
  end

  test "larger distance" do
    assert DNA.hamming_distance('ACCAGGG', 'ACTATGG') == 2
  end

  test "hamming distance is undefined for strands of different lengths" do
    assert DNA.hamming_distance('AAAC', 'TAGGGGAGGCTAGCGGTAGGAC') == nil
    assert DNA.hamming_distance('GACTACGGACAGGACACC', 'GACATCGC') == nil
  end

  test "hamming really big identical strands" do
    assert DNA.hamming_distance(1..1_000_000, 1..1_000_000) == 0
  end

  test "hamming really big half-identical strands" do
    assert DNA.hamming_distance(Stream.concat(1..500_000, 1..500_000), 1..1_000_000) == 500_000
  end

  test "hamming really big non-identical strands" do
    assert DNA.hamming_distance(2..1_000_001, 1..1_000_000) == 1_000_000
  end

end
