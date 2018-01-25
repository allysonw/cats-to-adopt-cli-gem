require "bundler/setup"
require "cats_to_adopt"
require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
end

VCR.use_cassette('example', :record => :new_episodes) do
  response = Net::HTTP.get_response('localhost', '/', $server.port)
  puts "Response: #{response.body}"
end 

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
