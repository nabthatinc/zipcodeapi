require 'faraday_middleware'
Dir[File.expand_path('../../faraday/*.rb', __FILE__)].each{|f| require f}

module ZipCodeApi

  module Connection
    private

    def connection
      options = {
        :headers => {'Accept' => "application/#{format}; charset=utf-8", 'User-Agent' => user_agent},
        :url => endpoint,
      }.merge(connection_options)

      Faraday::Connection.new(options) do |connection|
        connection.use Faraday::Request::UrlEncoded
        connection.use FaradayMiddleware::Mashify
        case format.to_s.downcase
        when 'json' then connection.use Faraday::Response::ParseJson
        end
        connection.use ZipCodeApi::Exceptions
        connection.adapter(adapter)
      end
    end
  end
end