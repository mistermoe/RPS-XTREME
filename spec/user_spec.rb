require 'spec_helper'

describe RPS::User do
  before do
    RPS::User.class_variable_set(:@@counter, 0)
    @user = RPS::User.new('fernando', 'tittywagon')
  end
  it 'exists' do
    expect(RPS::User).to be_a(Class)
  end

  describe '.initialize' do
    it 'auto generates an id' do
      expect(@user.id).to eq(1)
    end
    it 'takes a name as an argument' do
      expect(@user.username).to eq('fernando')
    end
    it 'takes a password as an argument' do
      expect(@user.password).to eq('tittywagon')
    end
    it 'sets win count to 0' do
      expect(@user.win_count).to eq(0)
    end
    it 'sets matches played to 0' do
      expect(@user.matches_played).to eq(0)
    end
  end

end
