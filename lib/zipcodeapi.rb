require File.expand_path('../zipcodeapi/error', __FILE__)
require File.expand_path('../zipcodeapi/configuration', __FILE__)
require File.expand_path('../zipcodeapi/api', __FILE__)
require File.expand_path('../zipcodeapi/client', __FILE__)

module ZipCodeApi
  extend Configuration
  
  def self.client(options={})
    ZipCodeApi::Client.new(options)
  end
end