require 'spec_helper'

describe RPS::Sessions do
  it 'exists' do
    expect(RPS::Sessions).to be_a(Class)
  end

  before do
    RPS::Sessions.class_variable_set(:@@counter, 0)
    @session = RPS::Sessions.new(1)
  end

  describe '.initialize' do
    it 'takes a user id' do
      expect(@session.uid).to eq(1)
    end
  end


end
