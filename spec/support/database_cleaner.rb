RSpec.configure do |config|
  config.before(:all) do
    Mongoid.purge!
  end
end