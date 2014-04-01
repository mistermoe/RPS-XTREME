require 'spec_helper'

describe RPS::DB do
  it 'exists' do
    expect(RPS::DB).to be_a(Class)
  end

  before do
    @db = RPS::DB.new
  end

  describe '.initialize' do
    it 'initializes an empty users hash' do
      expect(@db.users).to eq({})
    end
    it 'initializes an empty matches hash' do
      expect(@db.matches).to eq({})
    end
    it 'initializes an empty games hash' do
      expect(@db.games).to eq({})
    end
  end

  describe '.create_user' do
    it 'creates a user with a username and password' do
      username = 'fernando'
      password = 'tittywagon'
      user = @db.create_user(username, password)
      expect(user.username).to eq(username)
      expect(user.password).to eq(password)

    end
  end
  describe '.get_user' do
    it 'gets a user by uid' do
      user = @db.create_user('molly', 'maggots')
      user = @db.get_user(user.id)
    end
  end

end
