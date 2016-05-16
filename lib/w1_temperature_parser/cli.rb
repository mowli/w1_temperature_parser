class W1TemperatureParser::CLI
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def start
    options = W1TemperatureParser::OptsParser.parse params

    input_file = options.input_file
    if !input_file.nil?
      puts "#{input_file} does not exist" if !File.exists? input_file

      puts W1TemperatureParser::Parser.new(input_file).call
    end
  end
end
