# frozen_string_literal: true

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
end
