module AvantUtils
  require 'avant_utils/cnpj'
  require 'avant_utils/cpf'
  require 'avant_utils/url'
  require 'avant_utils/salution'
  require 'avant_utils/params_storage'
  require 'avant_utils/previous_location'
  require 'avant_utils/application_search'
  require 'avant_utils/active_model/cnpj_validator'
  require 'avant_utils/active_model/cpf_validator'
  require 'avant_utils/active_model/url_validator'
  require 'avant_utils/bootstrap/navbar_navigation'
  I18n.load_path += Dir[File.join(__dir__, 'avant_utils/locale/*.yml')]
end
