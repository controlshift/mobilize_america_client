require "bundler/setup"
require 'rspec'
require 'webmock/rspec'

$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')

require "mobilize_america_client"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include WebMock::API

  config.before :each do
    WebMock.reset!
  end

  config.after :each do
    WebMock.reset!
  end
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(File.join(fixture_path, '/', file))
end
