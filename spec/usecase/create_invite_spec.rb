require 'spec_helper'

describe RPS::CreateInvite do
  it 'creates a pending match' do
    home_player = RPS.DB.create_user('barbara beavertail', 'bushwacker')
    away_player = RPS.DB.create_user('frank thorton', 'danish fetish')

    home_session = RPS::SignIn.run(username: 'barbara beavertail', password: 'bushwacker')
    result = RPS::CreateInvite.run(session: home_session, username: 'frank thorton')

    expect(result.success?).to be_true
    expect(result.match.home_id).to eq(home_player.id)
    expect(result.match.away_id).to eq(away_player.id)


  end
end
