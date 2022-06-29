# frozen_string_literal: true

module Avant
  require 'avant/active_model/cnpj_validator'
  require 'avant/active_model/cpf_validator'
  require 'avant/active_model/email_validator'
  require 'avant/active_model/license_plate_validator'
  require 'avant/active_model/phone_validator'
  require 'avant/active_model/url_validator'
  require 'avant/active_model/zip_validator'
  require 'avant/axlsx/formulas'
  require 'avant/axlsx/styles'
  require 'avant/bootstrap/navbar_navigation'
  require 'avant/cnpj'
  require 'avant/constants'
  require 'avant/cpf'
  require 'avant/dates'
  require 'avant/email'
  require 'avant/filename'
  require 'avant/params_storage'
  require 'avant/phone'
  require 'avant/previous_location'
  require 'avant/salution'
  require 'avant/simple_search'
  require 'avant/url'
  I18n.load_path += Dir[File.join(__dir__, 'avant/locale/*.yml')]
end
