require 'date'
require '../src/helpers'
require '../src/api_entities/beacon_record_by_time_stamp'
require 'net/http'
require 'nokogiri'

class GetAllRecordsInTimeIntervalAndCount

  helpers = Helpers.new
  puts "Enter Start Time:"
  start_time = gets.chomp
  puts "Enter End Time:"
  end_time = gets.chomp

  start_time = helpers.shift_date(start_time).to_time.to_i
  end_time = helpers.shift_date(end_time).to_time.to_i

  all_outputs = helpers.generate_requests_and_get_all_outputs(start_time, end_time)

  splitted_value = helpers.split_value_char_by_char(all_outputs)
  counted_value = helpers.count_chars_in_output_value(splitted_value)
  helpers.print_counted_value(counted_value)

end




