require 'openssl'
require 'base64'

module ZipCodeApi
  
  module Request
    
    def get(path, options={})
      request(:get, path, options)
    end

    private

    def request(method, path, options)
      response = connection.send(method) do |request|
        
        case method
        when :get, :delete
          request.url(URI.encode(path), options)
        # when :post, :put
        #   request.path = URI.encode(path)
        #   request.body = options unless options.empty?
        end
      end
      return response.body
    end

  end
end