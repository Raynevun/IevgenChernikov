require 'date'
require '../src/helpers'

class GetValuesBetweenDates
  helpers = Helpers.new
  puts "Enter Start Time:"
  start_time = gets.chomp
  puts "Enter End Time:"
  end_date = gets.chomp
  
  start_time_hash = helpers.generate_time_hash(start_time)
  end_time_hash = helpers.generate_time_hash(end_time)

  start_time = helpers.shift_date(start_time_hash)
  end_time = helpers.shift_date(end_time_hash)

  start_time_unix = start_time.to_time.to_i
  end_time_unix = end_time.to_time.to_i

end




