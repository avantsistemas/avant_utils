# frozen_string_literal: true

module AvantUtils
  class Email
    def self.valid?(value)
      !(value =~ Constants::EMAIL_FORMAT).nil?
    end
  end
end
