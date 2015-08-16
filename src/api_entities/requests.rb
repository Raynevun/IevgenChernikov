require 'net/http'

class Requests

  def get_last_beacon_record
    #http = Net::HTTPSession.new("beacon.nist.gov", "80")
    #getLastRecord = Net::HTTP::Get.new("/rest/record/last")
    #http.request(getLastRecord)
    Net::HTTP.get_response(URI("https://beacon.nist.gov/rest/record/last"))
  end

  def get_beacon_record_by_timestamp(timestamp)
    Net::HTTP.get_response(URI("https://beacon.nist.gov/rest/record/#{timestamp}"))
  end


end