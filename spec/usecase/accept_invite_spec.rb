require 'spec_helper'

describe RPS::AcceptInvite do
  it 'accepts a pending invite' do
    home = RPS.DB.create_user('Becky Brofloski', 'chicken parfait')
    away = RPS.DB.create_user('Wayne', 'Titty Crumbs')

    # returns session key UseCase object
    home_sign_in = RPS::SignIn.run(username: home.username, password: home.password)
    # returns a match object
    home_create_invite = RPS::CreateInvite.run(session_key: home_sign_in, username: 'Wayne')

    away_sign_in = RPS::SignIn.run(username: away.username, password: away.password)

    # will return a game
    result = RPS::AcceptInvite.run(session_key: away_sign_in, username: home.username)

    expect(result.success?).to be_true
    expect(result.game.match_id).to eq(home_create_invite.match.id)
  end
end

# take what user passed in and returns a match whose user_name equals what the user passed in
#  check to see if the match's away id matches the current user id
# return error if not
#  otherwise spawn a game
