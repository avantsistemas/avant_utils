# frozen_string_literal: true

module AvantUtils
  module Constants
    CPF_FORMAT = /\A\d{3}\.\d{3}\.\d{3}-\d{2}\z/.freeze
    CNPJ_FORMAT = %r{\A\d{2}\.\d{3}\.\d{3}/\d{4}-\d{2}\z}.freeze
    EMAIL_FORMAT = /\A\s*([-\p{L}\d+._]{1,64})@((?:[-\p{L}\d]+\.)+\p{L}{2,})\s*\z/i.freeze
    URL_FORMAT = %r(https?://(www\.)?[-a-zA-Z0-9@:%._+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_+.~#?&/=]*)).freeze
    ZIP_FORMAT = /\A\d{5}-\d{3}\z/.freeze
  end
end
