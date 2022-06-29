# frozen_string_literal: true

module Avant
  class Phone
    BRAZILIAN_PHONE_WITHOUT_AREA_CODE = /(\d{4,5}-\d{4})/.freeze

    def self.brazilian_mobile?(value)
      match_data = BRAZILIAN_PHONE_WITHOUT_AREA_CODE.match(value.to_s)
      return false unless match_data

      first_number = match_data[0][0]
      %w[9 8 7 6].include? first_number
    end
  end
end
