# frozen_string_literal: true

module Avant
  class Cpf
    INVALID_CPFS = %w[
      12345678909
      11111111111
      22222222222
      33333333333
      44444444444
      55555555555
      66666666666
      77777777777
      88888888888
      99999999999
      00000000000
    ].freeze

    def self.valid?(value)
      stripped = value.to_s.gsub(/\D/, '')
      return false if INVALID_CPFS.include?(stripped)

      numbers = stripped.each_char.to_a.map(&:to_i)

      digits = numbers[0...9]
      digits << VerifierDigit.generate(digits)
      digits << VerifierDigit.generate(digits)

      digits[-2, 2] == numbers[-2, 2]
    end

    class VerifierDigit
      def self.generate(numbers)
        modulus = numbers.size + 1

        multiplied = numbers.map.each_with_index do |number, index|
          number * (modulus - index)
        end

        mod = multiplied.sum % 11
        mod < 2 ? 0 : 11 - mod
      end
    end
  end
end
