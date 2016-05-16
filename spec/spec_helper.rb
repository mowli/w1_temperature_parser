require 'w1_temperature_parser'

def fixture_path
  File.expand_path(File.join(File.dirname(__FILE__), 'fixtures'))
end

# Source http://stackoverflow.com/questions/11349270/test-output-to-command-line-with-rspec
def capture_stdout(&block)
  original_stdout = $stdout
  $stdout = fake = StringIO.new
  begin
    yield
  ensure
    $stdout = original_stdout
  end
  fake.string
end
