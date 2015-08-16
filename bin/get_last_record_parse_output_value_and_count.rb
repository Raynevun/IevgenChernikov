require '../bin/helpers'
require '../bin/api_entities/last_beacon_record'

class GetLastRecordParseOutputValueAndCount
  helpers = Helpers.new
  last_beacon_record = LastBeaconRecord.new
  output_value = last_beacon_record.get_output_value
  puts output_value
  splitted_value = helpers.split_value_char_by_char(output_value)
  counted_value = helpers.count_chars_in_output_value(splitted_value)
  helpers.print_counted_value(counted_value)
end