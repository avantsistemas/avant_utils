# frozen_string_literal: true

module AvantUtils
  class Email
    def self.valid?(value)
      regexp = /\A\s*([-\p{L}\d+._]{1,64})@((?:[-\p{L}\d]+\.)+\p{L}{2,})\s*\z/i
      !(value =~ regexp).nil?
    end
  end
end
