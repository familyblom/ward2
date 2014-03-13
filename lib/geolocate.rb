require 'net/http'
require 'uri'
require 'hashie'
class Geolocate

  def self.find(ip_address = nil)
    uri = URI("http://ipinfo.io/#{ip_address + '/' if ip_address }json")
    string_response = Net::HTTP.get(uri)
    response = JSON.parse(string_response)
    response.merge!("latitude" => response["loc"].split(',').first, "longitude" => response["loc"].split(',').last)
    Hashie::Mash.new( response )
  end

end
