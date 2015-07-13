require 'faraday'

module ZipCodeApi
  module Configuration

    VALID_OPTIONS_KEYS = [
      :api_key,
      :adapter,
      :endpoint,
      :format,
      :distance_units,
      :angle_units,
      :user_agent,
      :connection_options
    ].freeze

    DEFAULT_API_KEY = nil
    DEFAULT_ADAPTER = Faraday.default_adapter
    DEFAULT_ENDPOINT = 'http://www.zipcodeapi.com/rest/'.freeze
    DEFAULT_FORMAT = :json
    DEFAULT_DISTANCE_UNITS = :km
    DEFAULT_ANGLE_UNITS = :degrees
    DEFAULT_CONNECTION_OPTIONS = {}

    # The user agent that will be sent to the API endpoint if none is set
    DEFAULT_USER_AGENT = "ZipCodeApi Ruby Gem".freeze

    VALID_FORMATS = [
      :json, :xml, :csv].freeze

    attr_accessor *VALID_OPTIONS_KEYS

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    def reset
      self.api_key = DEFAULT_API_KEY
      self.adapter = DEFAULT_ADAPTER
      self.endpoint = DEFAULT_ENDPOINT
      self.format = DEFAULT_FORMAT
      self.distance_units = DEFAULT_DISTANCE_UNITS
      self.angle_units = DEFAULT_ANGLE_UNITS
      self.user_agent = DEFAULT_USER_AGENT
      self.connection_options = DEFAULT_CONNECTION_OPTIONS
    end
  end
end