class Complement

  MAPPINGS = {
    DNA: {
      "C" => "G",
      "G" => "C",
      "T" => "A",
      "A" => "U",
    },
    RNA: {
      "C" => "G",
      "G" => "C",
      "U" => "A",
      "A" => "T",
    },
  }

  MAPPINGS.keys.each do |molecule|
    self.define_singleton_method("of_#{molecule.downcase}") do |nbases|
      molecule_mapping = MAPPINGS[molecule]
      nbases.chars.map { |nbase| molecule_mapping[nbase] }.join
    end
  end

end
