module AvantUtils
  module Salution
    def self.salute(hour = Time.current.hour)
      if hour < 12
        I18n.t('salution.good_morning')
      elsif hour < 18
        I18n.t('salution.good_afternoon')
      else
        I18n.t('salution.good_night')
      end
    end
  end
end
