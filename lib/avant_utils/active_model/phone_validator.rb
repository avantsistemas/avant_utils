# frozen_string_literal: true

module ActiveModel
  module Validations
    class PhoneValidator < EachValidator
      def validate_each(record, attribute, value)
        return if value.blank? && options[:allow_blank]
        return if value.nil? && options[:allow_nil]
        return if AvantUtils::Constants::PHONE_FORMAT.match?(value)

        record.errors.add(attribute,
                          :invalid_phone,
                          message: options[:message],
                          value: value)
      end
    end
  end
end
