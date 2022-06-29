# frozen_string_literal: true

describe Avant::Salution do
  describe '.salute' do
    context 'when is moorning' do
      it { expect(described_class.salute(9)).to eq(I18n.t('salution.good_morning')) }
    end

    context 'when is afternoon' do
      it { expect(described_class.salute(14)).to eq(I18n.t('salution.good_afternoon')) }
    end

    context 'when is night' do
      it { expect(described_class.salute(21)).to eq(I18n.t('salution.good_night')) }
    end
  end
end
