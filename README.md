# W1TemperatureParser

Some utils to ease parsing results of DS18B20 temperature sensor. Retries a defined amount of times, if the sensor returns non-temperature values like 85000 (initial state) and 127687 (signed int - wrong communication)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'w1_temperature_parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install w1_temperature_parser

## Usage

Just call the binary with the sensor virtual file:
```
parse_temperature -i  /sys/bus/w1/devices/w1_bus_master1/10-[replace-with-correct-id]/w1_slave
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mowli/w1_temperature_parser. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

