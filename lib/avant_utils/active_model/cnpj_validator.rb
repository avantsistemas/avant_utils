module ActiveModel
  module Validations
    class CnpjValidator < EachValidator
      def validate_each(record, attribute, value)
        return if value.blank? && options[:allow_blank]

        return if value.nil? && options[:allow_nil]

        return if AvantUtils::Cnpj.valid?(value)

        record.errors.add(attribute, :invalid_cnpj, message: options[:message], value: value)
      end
    end
  end
end
