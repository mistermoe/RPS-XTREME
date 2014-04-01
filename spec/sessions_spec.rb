require 'spec_helper'

describe RPS::Sessions do
  it 'exists' do
    expect(RPS::Sessions).to be_a(Class)
  end

  before do
    RPS::Sessions.class_variable_set(:@@counter, 0)
    @session = RPS::Sessions.new(uid)
  end

  describe '.initialize' do
    it 'takes a user id' do

    end
  end


end
