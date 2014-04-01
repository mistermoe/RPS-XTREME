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

  describe '.create_match' do
    it 'creates a match' do
      match = @db.create_match
      expect(@db.matches.values.first.id).to eq(match.id)
    end
  end
  describe '.get_match' do
    it 'gets a match based on mid' do
      match = @db.create_match
      retrieved_match = @db.get_match(match.id)
      expect(retrieved_match.id).to eq(match.id)
    end
  end

    describe '.create_game' do
    it 'creates a game' do
      game = @db.create_game
      expect(@db.games.values.first.id).to eq(game.id)
    end
  end
  describe '.get_game' do
    it 'gets a game based on gid' do
      game = @db.create_game
      retrieved_game = @db.get_game(game.id)
      expect(retrieved_game.id).to eq(game.id)
    end
  end

end
