require 'spec_helper'

describe 'Match' do
  it 'exists' do
    expect(RPS::Match).to be_a(Class)
  end
  before do
    RPS::Match.class_variable_set(:@@counter, 0)
  end

  it 'is initialized with an id' do
    @newmatch = RPS::Match.new()
    id = @newmatch.id
    expect(id).to eq 1
  end

  it 'is initialized with a home_id, away_id and winner_id set to nil' do
    @newmatch = RPS::Match.new()
    homeid = @newmatch.home_id
    awayid = @newmatch.away_id
    winnerid = @newmatch.winner_id
    expect(homeid).to eq nil
    expect(awayid).to eq nil
    expect(winnerid).to eq nil
  end

end
