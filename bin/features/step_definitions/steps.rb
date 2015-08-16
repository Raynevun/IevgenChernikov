Given(/^I send request$/) do
  requests = Requests.new
  @response = requests.get_last_beacon_record
end

Given(/^I have response$/) do
  @response = LastBeaconRecord.new
end

Given(/^I have value$/) do
  @value = "AJK0FJR4KF44"
end

Given(/^I have splited value$/) do
  @splited_value = ["A", "J", "K", "0", "F", "J", "R", "4", "K", "F", "4", "4"]
end

When(/^I count chars$/) do
  helpers = Helpers.new
  @counted_chars = helpers.count_chars_in_output_value(@splited_value)
end

When(/^I try to get body$/) do
  @body = @response.get_body
end

When(/^I split value$/) do
  helpers = Helpers.new
  @splited_value = helpers.split_value_char_by_char(@value)
end

When(/^I try to get output value$/) do
  @output_value = @response.get_output_value
end

Then(/^I receive valid response$/) do
  refute_nil @response
  assert_equal Net::HTTPOK,@response.class
end

Then(/^Body is retrieved from response$/) do
  assert_equal Nokogiri::XML::Document,@body.class
  assert_includes @body.to_s, "<record>"
  assert_includes @body.to_s, "<seedValue>"
  assert_includes @body.to_s, "<outputValue>"
end

Then(/^Output value is received$/) do
  refute_nil @output_value
  assert_equal String, @output_value.class
  assert @output_value.length > 20
end

Then(/^I see array with splitted value$/) do
  assert_equal Array, @splited_value.class
  assert_equal ["A", "J", "K", "0", "F", "J", "R", "4", "K", "F", "4", "4"], @splited_value
end

Then(/^Chars are counted correctly$/) do
  assert_equal Hash["A" => 1, "J" => 2, "K" => 2, "0" => 1, "F" => 2, "R" => 1, "4" => 3], @counted_chars
end