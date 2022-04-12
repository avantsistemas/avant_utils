# frozen_string_literal: true

module ActiveModel
  module Validations
    class LicensePlateValidator < EachValidator
      def validate_each(record, attribute, value)
        return if value.blank? && options[:allow_blank]
        return if value.nil? && options[:allow_nil]
        return if AvantUtils::Constants::LICENSE_PLATE_FORMAT.match?(value)

        record.errors.add(attribute,
                          :invalid_license_plate,
                          message: options[:message],
                          value: value)
      end
    end
  end
end
