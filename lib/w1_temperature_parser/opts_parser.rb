require 'optparse'

module W1TemperatureParser
  class OptsParser
    def self.parse(options)
      result = Options.new
      opt_parser = OptionParser.new do |opts|
        opts.banner = 'Usage: parse_temperature.rb [options]'

        opts.on('-iINPUT_FILE', '--input=INPUT_FILE', 'input file') do |n|
          result.input_file = n
        end

        opts.on('-uUNIT', '--unit=UNIT', 'Unit of output, c/C - Celsius, f/F - Fahrenheit, k/K - Kelvin (standard celsius)') do |n|
          result.unit = n
        end

        opts.on('-h', '--help', 'Prints this help') do
          puts opts
        end

      end

      opt_parser.parse!(options)
      return result
    end
  end

  class Options < Struct.new(:input_file, :unit)
  end
end
