class ETL

  def self.transform(old_schema)
    old_schema.reduce({}) { |memo, (point_value, letters)|
      memo.merge letters.each_with_object({}) { |letter, hash|
        hash[letter.downcase] = point_value
      }
    }
  end

end
