if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("anagram.exs")
end

ExUnit.start

defmodule AnagramTest do
  use ExUnit.Case

  test "no matches" do
    matches = Anagram.match "diaper", ["hello", "world", "zombies", "pants"]
    assert matches == []
  end

  test "detect simple anagram" do
    matches = Anagram.match "ant", ["tan", "stand", "at"]
    assert matches == ["tan"]
  end

  test "detect multiple anagrams" do
    matches = Anagram.match "master", ["stream", "pigeon", "maters"]
    assert matches == ["stream", "maters"]
  end

  test "do not detect anagram subsets" do
    matches = Anagram.match "good", ~w(dog goody)
    assert matches == []
  end

  test "detect anagram" do
    matches = Anagram.match "listen", ~w(enlists google inlets banana)
    assert matches == ["inlets"]
  end

  test "multiple anagrams" do
    matches = Anagram.match "allergy", ~w(gallery ballerina regally clergy largely leading)
    assert matches == ["gallery", "regally", "largely"]
  end

  test "anagrams must use all letters exactly once" do
    matches = Anagram.match "patter", ["tapper"]
    assert matches == []
  end

  test "detect anagrams with case-insensitive subject" do
    matches = Anagram.match "Orchestra", ~w(cashregister carthorse radishes)
    assert matches == ["carthorse"]
  end

  test "detect anagrams with case-insensitive candidate" do
    matches = Anagram.match "orchestra", ~w(cashregister Carthorse radishes)
    assert matches == ["Carthorse"]
  end

  test "anagrams must not be the source word" do
    matches = Anagram.match "corn", ["corn", "dark", "Corn", "rank", "CORN", "cron", "park"]
    assert matches == ["cron"]
  end

  test "do not detect words based on checksum" do
    matches = Anagram.match "mass", ["last"]
    assert matches == []
  end

  test "German" do
    matches = Anagram.match "bäcker", ["abreck", "breck", "backer", "rebäck"]
    assert matches == ["rebäck"]
  end

  test "Chinese" do
    matches = Anagram.match "饒恕", ["恕饒", "帮忙", "饒恕"]
    assert matches == ["恕饒"]
  end

  test "emoji" do
    matches = Anagram.match "💥😎👌", ["💥💥💥", "😎👌💥", "👌😎👌"]
    assert matches == ["😎👌💥"]
  end

end
