# frozen_string_literal: true

describe AvantUtils::Cnpj do
  describe '.valid?' do
    context 'when cnpj is valid' do
      %w[04.367.805/0001-29 04367805000129].each do |cnpj|
        it "returns true (#{cnpj})" do
          expect(described_class.valid?(cnpj)).to be(true)
        end
      end
    end

    context 'when cnpj is invalid' do
      %w[04.367.805/0001-28 04367805000128].each do |cnpj|
        it "returns false (#{cnpj})" do
          expect(described_class.valid?(cnpj)).to be(false)
        end
      end
    end
  end
end
