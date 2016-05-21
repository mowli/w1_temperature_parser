module W1TemperatureParser
  class Parser
    ERROR_VALUES = [127687, 85000]
    MAXIMUM_TRIES = 1000

    attr_reader :file

    def initialize(file)
      @file = file
    end

    def raw_sensor_value
      lines = File.readlines(file)
      match_result = lines.join.match('t=(\d*)')
      match_result.values_at(1).first
    end

    def call
      sensor_value = nil
      measurements = 0
      while sensor_value.nil? || ERROR_VALUES.include?(sensor_value.to_i)
        raise maximum_tries_error_message if measurements > MAXIMUM_TRIES
        sensor_value = raw_sensor_value
        measurements += 1
      end
      Float(sensor_value)/1000
    end

    private
    def maximum_tries_error_message
      "Could not get a valid measurement after #{MAXIMUM_TRIES} attempts, is the sensor configured correctly?"
    end
  end
end

