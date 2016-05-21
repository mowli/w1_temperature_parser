require 'spec_helper'

describe W1TemperatureParser::Parser do
  let(:input_file) { File.join(fixture_path, 'valid_sample') }
  subject { described_class.new(input_file) }

  context 'valid input file' do
    it 'works' do
      expect(subject.call).to eql 22.875
    end
  end

  context 'invalid input file' do
    let(:input_file) { File.join(fixture_path, 'invalid_sample') }
    it 'works' do
      expect{subject.call}.to raise_error "Could not get a valid measurement after #{W1TemperatureParser::Parser::MAXIMUM_TRIES} attempts, is the sensor configured correctly?"
    end
  end

  context 'skips error values' do
    it 'returns first correct result' do
      return_values = W1TemperatureParser::Parser::ERROR_VALUES + [23000]
      allow(subject).to receive(:raw_sensor_value).and_return(*return_values)
      expect(subject.call).to eql 23.000
    end

    it 'raises an error if there is no correct value after a maximum amount of attempts' do
      return_values = [W1TemperatureParser::Parser::ERROR_VALUES.first] * W1TemperatureParser::Parser::MAXIMUM_TRIES
      allow(subject).to receive(:raw_sensor_value).and_return(*return_values)
      expect{subject.call}.to raise_error "Could not get a valid measurement after #{W1TemperatureParser::Parser::MAXIMUM_TRIES} attempts, is the sensor configured correctly?"
    end
  end

end
