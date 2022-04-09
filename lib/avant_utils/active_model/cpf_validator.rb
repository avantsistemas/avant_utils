# frozen_string_literal: true

module ActiveModel
  module Validations
    class CpfValidator < EachValidator
      def validate_each(record, attribute, value)
        return if value.blank? && options[:allow_blank]
        return if value.nil? && options[:allow_nil]
        return if format_valid?(value) && document_valid?(value)

        record.errors.add(attribute,
                          :invalid_cpf,
                          message: options[:message],
                          value: value)
      end

      private

      def format_valid?(value)
        AvantUtils::Constants::CPF_FORMAT.match?(value)
      end

      def document_valid?(value)
        AvantUtils::Cpf.valid?(value)
      end
    end
  end
end
