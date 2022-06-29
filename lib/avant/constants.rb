# frozen_string_literal: true

module Avant
  module Constants
    CNPJ_FORMAT = %r{\A\d{2}\.\d{3}\.\d{3}/\d{4}-\d{2}\z}.freeze
    CPF_FORMAT = /\A\d{3}\.\d{3}\.\d{3}-\d{2}\z/.freeze
    EMAIL_FORMAT = /\A\s*([-\p{L}\d+._]{1,64})@((?:[-\p{L}\d]+\.)+\p{L}{2,})\s*\z/i.freeze
    LICENSE_PLATE_FORMAT = /\A[A-Z]{3}-\d[A-Z\d]\d\d\z/.freeze
    PHONE_FORMAT = /\A\d{2}\s\d{4,5}-\d{4}\z/.freeze
    URL_FORMAT = %r(https?://(www\.)?[-a-zA-Z\d@:%._+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z\d@:%_+.~#?&/=]*)).freeze
    ZIP_FORMAT = /\A\d{5}-\d{3}\z/.freeze
  end
end
