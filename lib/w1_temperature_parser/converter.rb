require 'bigdecimal'

module W1TemperatureParser
  class Converter
    attr_reader :temperature

    def initialize(temperature)
      @temperature = temperature
    end

    def to_fahrenheit
      return nil if temperature.nil? || !temperature.is_a?(Numeric)

      (temperature * BigDecimal('1.8')) + 32
    end

    def to_kelvin
      return nil if temperature.nil? || !temperature.is_a?(Numeric)

      temperature + 273.15
    end
  end
end
