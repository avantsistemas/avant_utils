# frozen_string_literal: true

module AvantUtils
  class Cnpj
    INVALID_CNPJS = %w[
      00000000000000
      11111111111111
      22222222222222
      33333333333333
      44444444444444
      55555555555555
      66666666666666
      77777777777777
      88888888888888
      99999999999999
    ].freeze

    def self.valid?(value)
      stripped = value.to_s.gsub(/\D/, '')
      return false if INVALID_CNPJS.include?(stripped)

      numbers = stripped.each_char.to_a.map(&:to_i)

      digits = numbers[0...12]
      digits << VerifierDigit.generate(digits)
      digits << VerifierDigit.generate(digits)

      digits[-2, 2] == numbers[-2, 2]
    end

    class VerifierDigit
      def self.generate(numbers)
        index = 2

        sum = numbers.reverse.reduce(0) do |buffer, number|
          (buffer + (number * index)).tap do
            index = index == 9 ? 2 : index + 1
          end
        end

        mod = sum % 11
        mod < 2 ? 0 : 11 - mod
      end
    end
  end
end
