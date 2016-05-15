module W1TemperatureParser
  class Parser
    attr_reader :file

    def initialize(file)
      @file = file
    end

    def call
      lines = File.readlines(file)
      match_result = lines.join.match('t=(\d*)')
      sensor_value = match_result.values_at(1).first
      Float(sensor_value)/1000
    end
  end
end

