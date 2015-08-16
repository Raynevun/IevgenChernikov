require '../bin/api_entities/requests'
require 'nokogiri'

class LastBeaconRecord
  @@requests = Requests.new
  @@response = @@requests.get_last_beacon_record

  def get_body
    Nokogiri::XML(@@response.body)
  end

  def get_output_value
    self.get_body.xpath("//outputValue/text()").to_s
  end

end