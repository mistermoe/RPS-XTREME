require 'spec_helper'

describe 'Game' do
  it 'exists' do
    expect(RPS::Game).to be_a(Class)
  end

  it 'is initialized with an id' do
    @newgame = RPS::Game.new(1,1)
    id = @newgame.id
    expect(id).to eq 1
  end

  it 'is initialized with an match id' do
    @newgame = RPS::Game.new(1,1)
    match_id = @newgame.match_id
    expect(match_id).to eq 1
  end

  it 'is initialized with a winner id' do
    @newgame = RPS::Game.new(1,1)
    winner_id = @newgame.winner_id
    expect(winner_id).to eq 1
  end

  it 'is initialized with a homeplay and awayplay set to nil' do
    @newgame = RPS::Game.new(1,1)
    homeplay = @newgame.home_play
    awayplay = @newgame.away_play
    expect(homeplay).to eq nil
    expect(awayplay).to eq nil
  end


end
