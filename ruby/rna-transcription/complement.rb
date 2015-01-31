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
      "A" => "T",
      "U" => "A",
    },
  }

  MAPPINGS.keys.each do |molecule|
    molecule_mapping = MAPPINGS[molecule]
    self.define_singleton_method("of_#{molecule.downcase}") do |nbases|
      nbases.chars.map { |nbase| molecule_mapping[nbase] }.join
    end
  end

end
