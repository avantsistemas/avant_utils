# frozen_string_literal: true

module ActiveModel
  module Validations
    class EmailValidator < EachValidator
      def validate_each(record, attribute, value)
        return if value.blank? && options[:allow_blank]
        return if value.nil? && options[:allow_nil]
        return if AvantUtils::Email.valid?(value)

        record.errors.add(attribute,
                          :invalid_email,
                          message: options[:message],
                          value: value)
      end
    end
  end
end
