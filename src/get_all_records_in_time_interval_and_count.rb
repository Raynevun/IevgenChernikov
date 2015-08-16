require 'date'
require '../src/helpers'
require '../src/api_entities/beacon_record_by_time_stamp'
require 'net/http'
require 'nokogiri'

class GetAllRecordsInTimeIntervalAndCount

  helpers = Helpers.new
  puts "Enter Start Time:"
  start_time = gets.chomp
  start_time = helpers.shift_date(start_time).to_time.to_i

  helpers.stop_if_date_before_epoch_time(start_time)

  puts "Enter End Time:"
  end_time = gets.chomp
  end_time = helpers.shift_date(end_time).to_time.to_i

  helpers.stop_if_date_before_epoch_time(end_time)

  all_outputs = helpers.generate_requests_and_get_all_outputs(start_time, end_time)

  splitted_value = helpers.split_value_char_by_char(all_outputs)
  counted_value = helpers.count_chars_in_output_value(splitted_value)
  helpers.print_counted_value(counted_value)

end




