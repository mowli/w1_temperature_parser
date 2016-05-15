require 'spec_helper'
require 'w1_temperature_parser'

describe W1TemperatureParser::Parser do
  subject { described_class.new(input_file) }
  context 'valid input file' do
    let(:input_file) { File.join(fixture_path, 'valid_sample') }
    it 'works' do
      expect(subject.call).to eql 22.875
    end
  end
end
