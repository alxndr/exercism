class ETL

  def self.transform(old_schema)
    old_schema.reduce({}) { |memo, obj|
      point_value, letters = *obj
      letters.each do |letter|
        memo[letter.downcase] = point_value
      end
      memo
    }
  end

end
