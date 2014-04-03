require 'spec_helper'

describe RPS::AcceptInvite do
  it 'accepts a pending invite' do
    home = RPS.DB.create_user('Becky Brofloski', 'chicken parfait')
    home_session = RPS.DB.create_session(home.id)

    away = RPS.DB.create_user('Wayne', 'Titty Crumbs')
    away_session = RPS.DB.create_session(away.id)


    # returns a match object
    match = RPS.DB.create_match(home.id, away.id)

    # will return a game
    result = RPS::AcceptInvite.run(session_key: away_session.id, username: home.username)

    expect(result.success?).to be_true
    expect(result.game.match_id).to eq(match.id)
  end
end

# take what user passed in and returns a match whose user_name equals what the user passed in
#  check to see if the match's away id matches the current user id
# return error if not
#  otherwise spawn a game
