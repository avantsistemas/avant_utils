module AvantUtils
  require 'avant_utils/cnpj'
  require 'avant_utils/cpf'
  require 'avant_utils/url'
  require 'avant_utils/previous_location'
  require 'avant_utils/active_model/cnpj_validator'
  require 'avant_utils/active_model/cpf_validator'
  I18n.load_path += Dir[File.join(__dir__, 'avant_utils/locale/*.yml')]
end
