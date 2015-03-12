VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
end

RSpec.configure do |c|
  c.around :each, vcr: true do |example|
    example_description = example.metadata[:full_description]
    cassette_name = example_description.gsub(/\s+/, '_').downcase
    VCR.use_cassette cassette_name do
      example.run
    end
  end
end
