# frozen_string_literal: true

module AvantUtils
  class Email
    def self.valid?(value)
      Constants::EMAIL_FORMAT.match? value
    end
  end
end
