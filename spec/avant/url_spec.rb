# frozen_string_literal: true

describe Avant::Url do
  describe '.valid?' do
    context 'when url is valid' do
      [
        'http://domain.com',
        'https://domain.com',
        ' http://domain.com ',
        'http://domain.com?par=1',
        'http://domain.com?par1=x&par2=y',
        'http://domain.com.br',
        'https://we.tl/pg8CXuhtYA'
      ].each do |url|
        it "returns true (#{url})" do
          expect(described_class.valid?(url)).to be(true)
        end
      end
    end

    context 'when url is invalid' do
      [
        'domain.com',
        ' http:// domain.com ',
        'http:/domain.com?par=1',
        'httt://domain.com?par1=x&par2=y',
        'http://domain'
      ].each do |url|
        it "returns false (#{url})" do
          expect(described_class.valid?(url)).to be(false)
        end
      end
    end
  end

  describe '#add_params' do
    it do
      expect(described_class.add_params('http://url.com', param: 'value')).to eq('http://url.com?param=value')
    end

    it do
      expect(described_class.add_params('http://url.com?p1=v1&p2=v2', param: 'value'))
        .to eq('http://url.com?p1=v1&p2=v2&param=value')
    end

    it do
      expect(described_class.add_params('http://url.com#&tro&lo&lo', param: 'value'))
        .to eq('http://url.com?param=value#&tro&lo&lo')
    end

    it do
      expect(described_class.add_params('http://url.com?p1=v1&p2=v2#&tro&lo&lo', param: 'value'))
        .to eq('http://url.com?p1=v1&p2=v2&param=value#&tro&lo&lo')
    end

    it 'returns url when params is empty' do
      expect(described_class.add_params('http://url.com', {})).to eq('http://url.com')
    end

    it 'returns url when params is nil' do
      expect(described_class.add_params('http://url.com', nil)).to eq('http://url.com')
    end
  end
end
