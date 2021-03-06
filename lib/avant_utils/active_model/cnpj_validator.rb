module ActiveModel
  module Validations
    class CnpjValidator < EachValidator
      def validate_each(record, attribute, value)
        return if value.blank? && options[:allow_blank]

        return if value.nil? && options[:allow_nil]

        return if format_valid?(value) && document_valid?(value)

        record.errors.add(attribute, :invalid_cnpj, message: options[:message], value: value)
      end

      private

      def format_valid?(value)
        value.to_s =~ %r{\A\d{2}\.\d{3}\.\d{3}/\d{4}-\d{2}\z}
      end

      def document_valid?(value)
        AvantUtils::Cnpj.valid?(value)
      end
    end
  end
end
