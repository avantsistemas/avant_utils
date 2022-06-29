# frozen_string_literal: true

module ActiveModel
  module Validations
    class CpfValidator < EachValidator
      def validate_each(record, attribute, value)
        return if value.blank? && options[:allow_blank]
        return if value.nil? && options[:allow_nil]
        return if valid_format?(value) && valid_document?(value)

        record.errors.add(attribute,
                          :invalid_cpf,
                          message: options[:message],
                          value: value)
      end

      private

      def valid_format?(value)
        Avant::Constants::CPF_FORMAT.match?(value)
      end

      def valid_document?(value)
        Avant::Cpf.valid?(value)
      end
    end
  end
end
