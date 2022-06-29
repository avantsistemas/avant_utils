# frozen_string_literal: true

module ActiveModel
  module Validations
    class ZipValidator < EachValidator
      def validate_each(record, attribute, value)
        return if value.blank? && options[:allow_blank]
        return if value.nil? && options[:allow_nil]
        return if Avant::Constants::ZIP_FORMAT.match?(value)

        record.errors.add(attribute,
                          :invalid_zip,
                          message: options[:message],
                          value: value)
      end
    end
  end
end
