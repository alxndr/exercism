DNA_TO_RNA = {
  "C" => "G",
  "G" => "C",
  "T" => "A",
  "A" => "U",
}

class Complement
  {
    DNA: DNA_TO_RNA,
    RNA: DNA_TO_RNA.invert,
  }.each do |molecule_symbol, molecule_mapping|
    self.define_singleton_method("of_#{molecule_symbol.downcase}") do |nbases|
      nbases.each_char.map { |nbase| molecule_mapping[nbase] }.join
    end
  end
end
