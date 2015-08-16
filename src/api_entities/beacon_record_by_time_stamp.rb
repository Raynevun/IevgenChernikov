require '../src/api_entities/requests'
class BeaconRecordByTimeStamp

  def initialize(timestamp)
    @@requests = Requests.new
    @@response = @@requests.get_beacon_record_by_timestamp(timestamp)
  end

  def get_body
    Nokogiri::XML(@@response.body)
  end

  def get_output_value
    self.get_body.xpath("//outputValue/text()").to_s
  end
end