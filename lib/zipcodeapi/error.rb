module ZipCodeApi

  class Error < StandardError; end

  # 400
  class BadRequest < Error; end

  # 404
  class NotFound < Error; end

  # 500
  class InternalServerError < Error; end

  # 502
  class BadGateway < Error; end

  # 503
  class ServiceUnavailable < Error; end

  # 504
  class GatewayTimeout < Error; end

end