module ZipCodeApi
  class Client
    
    module Utils

      def codes_by_radius(zip_code, distance, options = {})
        response = get("#{api_key}/radius.#{format}/#{zip_code}/#{distance}/#{distance_units}", options)
        response
      end

      def codes_distance(zip_code, zip_code2, options = {})
        response = get("#{api_key}/distance.#{format}/#{zip_code}/#{zip_code2}/#{distance_units}", options)
        response
      end

    end

  end
end