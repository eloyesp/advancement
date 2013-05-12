require 'minitest/autorun'
require 'rails/generators/test_case'

# Best reports
require 'minitest/reporters'
MiniTest::Reporters.use! [
  MiniTest::Reporters::SpecReporter.new,
  MiniTest::Reporters::GuardReporter.new
]

# Load support files
# Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

class MiniTest::Unit::TestCase

  def fixture_data_file
    File.new(File.join(File.dirname(__FILE__), 'fixture_data.yml'))
  end

end

