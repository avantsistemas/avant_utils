# frozen_string_literal: true

module AvantUtils
  class Email
    def self.valid?(value)
      Constants::EMAIL_FORMAT.match?(value.to_s)
    end
  end
end
