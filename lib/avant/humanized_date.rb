# frozen_string_literal: true

module Avant
  # Formatação "humanizada" de datas (date, datetime ou time).
  #
  # Exemplos:
  #
  # AvantUtils::HumanizedDate.humanize(Time.current) => "Hoje, 19:08"
  # AvantUtils::HumanizedDate.humanize(Time.current.tormorrow) => "Amanhã, 19:08"
  # AvantUtils::HumanizedDate.humanize(Time.current.yesterday) => "Ontem, 19:08"
  # AvantUtils::HumanizedDate.humanize(Time.current.beginning_of_week) => "Seg, 00:00"
  #
  # Referência: http://stackoverflow.com/a/21150964
  class HumanizedDate
    def self.humanize(date)
      return humanized_time(date) if date.is_a?(Time)
      return humanized_date(date) if date.is_a?(Date)

      raise ArgumentError, "Object must be a Date, DateTime or Time object. #{date.inspect} given."
    end

    class << self
      private

      def humanized_time(time)
        st = Time.current.beginning_of_day
        nd = Time.current.end_of_day

        if time.between?(st + 1.day, nd + 1.day)
          "#{I18n.t('labels.tomorrow')}, #{time.strftime('%H:%M')}"
        elsif time.between?(st, nd)
          "#{I18n.t('labels.today')}, #{time.strftime('%H:%M')}"
        elsif time.between?(st - 1.day, nd - 1.day)
          "#{I18n.t('labels.yesterday')}, #{time.strftime('%H:%M')}"
        elsif time.between?(st - 6.days, nd - 2.days)
          I18n.l(time, format: '%a, %H:%M').titlecase
        else
          I18n.l(time, format: '%d/%m/%y, %H:%M')
        end
      end

      def humanized_date(date)
        st = Time.current.beginning_of_day
        nd = Time.current.end_of_day
        date = date.in_time_zone

        if date.between?(st + 1.day, nd + 1.day)
          I18n.t('labels.tomorrow')
        elsif date.between?(st, nd)
          I18n.t('labels.today')
        elsif date.between?(st - 1.day, nd - 1.day)
          I18n.t('labels.yesterday')
        elsif date.between?(st - 6.days, nd - 2.days)
          I18n.l(date, format: '%a, %d/%m').titlecase
        else
          I18n.l(date, format: '%d/%m/%y')
        end
      end
    end
  end
end
