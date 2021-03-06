require 'spec_helper'

describe RPS::DB do
  it 'exists' do
    expect(RPS::DB).to be_a(Class)
  end

  before do
    RPS::Match.class_variable_set(:@@counter, 0)
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
      home = @db.create_user('cornelius cordova', 'butchfest 2025')
      away = @db.create_user('agnus tillyweed', 'frothy milk')

      match = @db.create_match(home.id, away.id)

      expect(@db.matches.values.first.id).to eq(match.id)
      expect(@db.matches.values.first.home_id).to eq(home.id)
      expect(@db.matches.values.first.away_id).to eq(away.id)
    end
  end
  describe '.get_match' do
    it 'gets a match based on mid' do
      match = @db.create_match(1, 1)
      retrieved_match = @db.get_match(match.id)
      expect(retrieved_match.id).to eq(match.id)
    end
  end

    describe '.create_game' do
    it 'creates a game' do
      game = @db.create_game(1)
      expect(@db.games.values.first.id).to eq(game.id)
      expect(@db.games.values.first.match_id).to eq(1)
    end
  end
  describe '.get_game' do
    it 'gets a game based on mid' do

      home = @db.create_user('cornelius cordova', 'butchfest 2025')
      away = @db.create_user('agnus tillyweed', 'frothy milk')

      match = @db.create_match(home.id, away.id)
      game = @db.create_game(match.id)
      retrieved_game = @db.get_game(match.id)

      expect(retrieved_game.first.match_id).to eq(match.id)
    end
  end

end
