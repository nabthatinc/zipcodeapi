require File.expand_path('../connection', __FILE__)
require File.expand_path('../request', __FILE__)

module ZipCodeApi
  
  class Api
    
    attr_accessor *Configuration::VALID_OPTIONS_KEYS

    
    def initialize(options={})
      options = ZipCodeApi.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    def config
      conf = {}
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        conf[key] = send key
      end
      conf
    end

    include Connection
    include Request
  end
end