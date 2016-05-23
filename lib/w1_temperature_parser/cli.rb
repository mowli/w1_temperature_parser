class W1TemperatureParser::CLI
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def start
    options = W1TemperatureParser::OptsParser.parse params

    input_file = options.input_file

    unit = options.unit || 'c'
    unless ['c', 'f', 'k'].include?(unit.to_s.downcase)
      puts "Unknown unit #{unit}"
    end

    if !input_file.nil?
      puts "#{input_file} does not exist" if !File.exists? input_file
      temperature = W1TemperatureParser::Parser.new(input_file).call
      converter = W1TemperatureParser::Converter.new(BigDecimal(temperature.to_s))

      case unit.downcase
      when 'k'
        temperature = converter.to_kelvin.to_f
      when 'f'
        temperature = converter.to_fahrenheit.to_f
      end

      puts temperature
    end
  end
end
