# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

describe Avant::Dates do
  describe '.humanize' do
    context 'when date is yesterday' do
      it 'returns yesterday' do
        date = Date.yesterday

        expect(described_class.humanize(date)).to eq(I18n.t('labels.yesterday'))
      end
    end

    context 'when date is today' do
      it 'returns today' do
        date = Date.current

        expect(described_class.humanize(date)).to eq(I18n.t('labels.today'))
      end
    end

    context 'when date is tomorrow' do
      it 'returns tomorrow' do
        date = Date.tomorrow

        expect(described_class.humanize(date)).to eq(I18n.t('labels.tomorrow'))
      end
    end
  end

  describe '.age' do
    it 'returns the correct age' do
      dob = Date.current - 35.years

      expect(described_class.age(dob)).to eq(35)
    end

    it 'returns zero as the age' do
      dob = Date.current - 11.months

      expect(described_class.age(dob)).to eq(0)
    end
  end
end
