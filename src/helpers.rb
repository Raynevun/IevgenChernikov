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

  def get_months(time_hash)
    if time_hash["month"].to_i == 0
      months = time_hash["months"].to_i
    else
      months = time_hash["month"].to_i
    end
    return months
  end

  def get_days(time_hash)
    if time_hash["day"].to_i == 0
      days = time_hash["days"].to_i
    else
      days = time_hash["day"].to_i
    end
    return days
  end

  def generate_time_hash(time)
    time_hash = Hash.new
    time = time.split()
    time.delete("ago")
    amount = time.size
    for i in 0..amount-1
      if i % 2 == 0
        time_hash[time[i+1]] = time[i]
      end
    end
    return time_hash
  end

  def shift_date(time_hash)
    date = DateTime.now
    months_shift = self.get_months(time_hash)
    days_shift = self.get_days(time_hash)
    hours_shift = self.get_hours(time_hash)
    minutes_shift = self.get_minutes(time_hash)
    date = date << months_shift
    date = date - days_shift
    date = date - hours_shift.to_f/24
    date = date - minutes_shift.to_f/(24*60)
    return date
  end

  def get_hours(time_hash)
    if time_hash["hour"].to_i == 0
      hours = time_hash["hours"].to_i
    else
      hours = time_hash["hour"].to_i
    end
    return hours
  end

  def get_minutes(time_hash)
    if time_hash["minute"].to_i == 0
      minutes = time_hash["minutes"].to_i
    else
      minutes = time_hash["minute"].to_i
    end
    return minutes
  end

end