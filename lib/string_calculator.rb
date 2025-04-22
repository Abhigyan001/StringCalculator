class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
    nums = []
    
    if numbers.start_with?("//")
      delimiter_section = numbers.split("\n", 2)[0]
      numbers_part = numbers.split("\n", 2)[1]
      
      if delimiter_section.start_with?("//[") && delimiter_section.end_with?("]")
        delimiter = delimiter_section[3..-2]
      else
        delimiter = delimiter_section[2]
      end
      
      nums = numbers_part.gsub(delimiter, ",").split(',').map(&:to_i)
    else
      nums = numbers.gsub("\n", ",").split(',').map(&:to_i)
    end

    negatives = nums.select { |n| n < 0 }

    if negatives.any?
      raise "Negative numbers not allowed #{negatives.join(',')}"
    end
    
    nums.select { |n| n <= 1000 }.sum
  end
end
