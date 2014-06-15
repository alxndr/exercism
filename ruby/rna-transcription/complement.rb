class Complement

  MAPPINGS = {
    DNA: { C: :G, G: :C, T: :A, A: :U },
    RNA: { C: :G, G: :C, U: :A, A: :T },
  }

  class << self
    [:DNA, :RNA].each do |molecule|
      define_method "of_#{molecule.downcase}" do |nbases|
        nbases.split('').map { |nbase| MAPPINGS[molecule][nbase.to_sym].to_s }.join('')
      end
    end
  end

end
