require 'spec_helper'

describe W1TemperatureParser::CLI do
  it 'shows help dialog' do
    output = capture_stdout do
      described_class.new(['-h']).start
    end
    expect(output).to eql "Usage: parse_temperature.rb [options]\n    -i, --input=INPUT_FILE           input file\n    -h, --help                       Prints this help\n"
  end
end
