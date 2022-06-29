# frozen_string_literal: true

describe Avant::Phone do
  describe '.brazilian_mobile?' do
    context 'when phone is mobile' do
      ['9999-9999', '89999-9999', '7999-9999', '69999-9999',
       '31 9999-9999', '21 89999-9999', '15 7999-9999', '19 69999-9999'].each do |phone|
        it "returns true (#{phone})" do
          expect(described_class.brazilian_mobile?(phone)).to be(true)
        end
      end
    end

    context 'when phone is not mobile' do
      %w[2333-3333 3333-3333 4333-3333 5333-3333].each do |phone|
        it "returns false (#{phone})" do
          expect(described_class.brazilian_mobile?(phone)).to be(false)
        end
      end
    end
  end
end
