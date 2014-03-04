class ETL

  def self.transform(old_schema)
    old_schema.reduce({}) { |memo, (point_value, letters)|
      memo.merge(letters.reduce({}) { |hash, letter|
        hash[letter.downcase] = point_value
        hash
      })
    }
  end

end
