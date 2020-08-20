module AvantUtils
  class Url
    def self.valid?(value)
      regexp = %r(https?:\/\/(www\.)?[-a-zA-Z0-9@:%._+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_+.~#?&/=]*))
      !(value =~ regexp).nil?
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
