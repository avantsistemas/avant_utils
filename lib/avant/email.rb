# frozen_string_literal: true

module Avant
  class Email
    def self.valid?(value)
      Constants::EMAIL_FORMAT.match?(value.to_s)
    end
  end
end
