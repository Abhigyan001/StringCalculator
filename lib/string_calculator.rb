class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
    nums = []
    
    if numbers.start_with?("//")
      delimiter_section = numbers.split("\n", 2)[0]
      numbers_part = numbers.split("\n", 2)[1]
      
      if delimiter_section.include?("[")
        delimiters = delimiter_section.scan(/\[(.*?)\]/).flatten

        numbers_to_process = numbers_part
        delimiters.each do |delimiter|
          numbers_to_process = numbers_to_process.gsub(delimiter, ",")
        end
        
        nums = numbers_to_process.split(',').map(&:to_i)
      else
        delimiter = delimiter_section[2]
        nums = numbers_part.gsub(delimiter, ",").split(',').map(&:to_i)
      end
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
