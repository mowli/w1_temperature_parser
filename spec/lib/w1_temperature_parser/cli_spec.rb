require 'spec_helper'

describe W1TemperatureParser::CLI do
  let(:input_file) { File.join(fixture_path, 'valid_sample') }

  it 'shows help dialog' do
    output = capture_stdout do
      described_class.new(['-h']).start
    end
    expect(output).to eql  "Usage: parse_temperature.rb [options]\n    -i, --input=INPUT_FILE           input file\n    -u, --unitUNITUNIT               Choose unit of output (standard celsius)\n    -h, --help                       Prints this help\n"
  end

  it 'outputs the temperature of input file' do
    output = capture_stdout do
      described_class.new(["-i#{input_file}"]).start
    end
    expect(output).to eql "22.875\n"
  end

  it 'outputs the temperature of input file in fahrenheit' do
    output = capture_stdout do
      described_class.new(["-i#{input_file}", "-uF"]).start
    end
    expect(output).to eql "73.175\n"
  end
end
