require 'faraday'

module ZipCodeApi

  class Exceptions < Faraday::Middleware
    def call(env)
      @app.call(env).on_complete do |response|
        case response[:status].to_i
        when 400
          raise ZipCodeApi::BadRequest, error_message_400(response)
        when 404
          raise ZipCodeApi::NotFound, error_message_400(response)
        when 500
          raise ZipCodeApi::InternalServerError, error_message_500(response, "Something is technically wrong.")
        when 502
          raise ZipCodeApi::BadGateway, error_message_500(response, "The server returned an invalid or incomplete response.")
        when 503
          raise ZipCodeApi::ServiceUnavailable, error_message_500(response, "ZipCodeApi is rate limiting your requests.")
        when 504
          raise ZipCodeApi::GatewayTimeout, error_message_500(response, "504 Gateway Time-out")
        end
      end
    end

    def initialize(app)
      super app
      @parser = nil
    end

    private

    def error_message_400(response)
      "#{response[:method].to_s.upcase} #{response[:url].to_s}: #{response[:status]}#{error_body(response[:body])}"
    end

    def error_body(body)
      if not body.nil? and not body.empty? and body.kind_of?(String)
        body = ::JSON.parse(body)
      end

      if body.nil?
        nil
      elsif body['meta'] and body['meta']['error_message'] and not body['meta']['error_message'].empty?
        ": #{body['meta']['error_message']}"
      elsif body['error_message'] and not body['error_message'].empty?
        ": #{body['error_type']}: #{body['error_message']}"
      end
    end

    def error_message_500(response, body=nil)
      "#{response[:method].to_s.upcase} #{response[:url].to_s}: #{[response[:status].to_s + ':', body].compact.join(' ')}"
    end
  end
end