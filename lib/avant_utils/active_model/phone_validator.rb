# frozen_string_literal: true

module ActiveModel
  module Validations
    class PhoneValidator < EachValidator
      def validate_each(record, attribute, value)
        return if value.blank? && options[:allow_blank]

        return if value.nil? && options[:allow_nil]

        return if format_valid?(value)

        record.errors.add(attribute, :invalid_phone, message: options[:message], value: value)
      end

      private

      def format_valid?(value)
        AvantUtils::Phone.brazilian_format?(value)
      end
    end
  end
end
