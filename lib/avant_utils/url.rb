# frozen_string_literal: true

module AvantUtils
  class Url
    def self.valid?(value)
      Constants::URL_FORMAT.match?(value.to_s)
    end

    # Referência: http://stackoverflow.com/a/16623769/2640073
    def self.add_params(url, params)
      return url if params.blank?

      uri = URI(url)
      params = URI.decode_www_form(uri.query || '') + params.to_a
      uri.query = URI.encode_www_form(params)
      uri.to_s
    end
  end
end
