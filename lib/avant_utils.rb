module AvantUtils
  require 'avant_utils/cnpj'
  require 'avant_utils/active_model/cnpj_validator'
  I18n.load_path += Dir[File.join(__dir__, 'avant_utils/locale/*.yml')]
end
