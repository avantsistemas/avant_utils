# frozen_string_literal: true

describe AvantUtils::Cpf do
  describe '.valid?' do
    context 'when cpf is valid' do
      %w[647.419.573-81 64741957381].each do |cnpj|
        it "returns true (#{cnpj})" do
          expect(described_class.valid?(cnpj)).to be(true)
        end
      end
    end

    context 'when cpf is invalid' do
      %w[647.419.573-82 64741957382].each do |cnpj|
        it "returns false (#{cnpj})" do
          expect(described_class.valid?(cnpj)).to be(false)
        end
      end
    end
  end
end
