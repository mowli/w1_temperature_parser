require 'spec_helper'

describe W1TemperatureParser::Converter do
  context 'converts positive values' do
    subject { W1TemperatureParser::Converter.new(30) }

    it 'converts to fahrenheits' do
      expect(subject.to_fahrenheit.to_f).to eql 86.0
    end
  end

  context 'converts negative values' do
    subject { W1TemperatureParser::Converter.new(-39) }

    it 'converts to fahrenheits' do
      expect(subject.to_fahrenheit.to_f).to eql(-38.2)
    end
  end

  context 'handles nil values', focus: true do
    subject { W1TemperatureParser::Converter.new(nil) }

    it 'converts to fahrenheits' do
      expect(subject.to_fahrenheit).to be_nil
    end
  end
end
