describe AvantUtils::Phone do
  describe '.brazilian_format?' do
    context 'when phone format is correct' do
      ['31 9999-8888', '31 98888-7777'].each do |phone|
        it "returns true (#{phone})" do
          expect(described_class.brazilian_format?(phone)).to eq(true)
        end
      end
    end

    context 'when phone format is not correct' do
      ['9999-8888', '98888-7777', '31 9999-88888', '31 998888-7777', '31 98888-77777',
       '31 9999-888', '31 888-7777', '031 9999-8888', '031 98888-7777'].each do |phone|
        it "returns false (#{phone})" do
          expect(described_class.brazilian_format?(phone)).to eq(false)
        end
      end
    end
  end

  describe '.brazilian_mobile?' do
    context 'when phone is mobile' do
      %w[9999-9999 89999-9999 7999-9999 69999-9999].each do |phone|
        it "returns true (#{phone})" do
          expect(described_class.brazilian_mobile?(phone)).to eq(true)
        end
      end
    end

    context 'when phone is not mobile' do
      %w[2333-3333 3333-3333 4333-3333 5333-3333].each do |phone|
        it "returns false (#{phone})" do
          expect(described_class.brazilian_mobile?(phone)).to eq(false)
        end
      end
    end
  end
end
