require 'require_all'
require_rel '../lib/rps-extreme.rb'
require 'pry-debugger'

RSpec.configure do |config|
  # Configure each test to always use a new singleton instance
  config.before(:each) do
    RPS.instance_variable_set(:@__db, nil)
    RPS::User.class_variable_set(:@@counter, 0)
    RPS::Game.class_variable_set(:@@counter, 0)
    RPS::Match.class_variable_set(:@@counter, 0)
    RPS::Sessions.class_variable_set(:@@counter, 0)
  end
end
