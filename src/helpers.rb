class Helpers

  def split_value_char_by_char(value_string)
    value_by_char = Array.new
    value_string.each_char do |char|
      value_by_char.push(char)
    end
    return value_by_char
  end

  def count_chars_in_output_value(splited_value_array)
    counted_chars = Hash.new
    splited_value_array.each do |char|
      if counted_chars.include? char
        counted_chars[char] = counted_chars[char] + 1
      else
        counted_chars[char] = 1
      end
    end
    return counted_chars
  end

  def print_counted_value(counted_value_hash)
    counted_value_hash.each do |key, value|
      puts key.to_s + ',' + value.to_s
    end
  end

end