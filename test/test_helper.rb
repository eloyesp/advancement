require 'minitest/autorun'

# Load support files
# Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

class MiniTest::Unit::TestCase

  def fixture_data_file
    File.new(File.join(File.dirname(__FILE__), 'test_data.yml'))
  end

end

