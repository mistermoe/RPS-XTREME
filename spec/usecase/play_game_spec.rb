require 'spec_helper'
describe RPS::PlayGame do
  it 'fuckin plays the game' do

    home = RPS.DB.create_user('Becky Brofloski', 'chicken parfait')
    away = RPS.DB.create_user('Wayne', 'Titty Crumbs')
    # returns session key UseCase object
    home_sign_in = RPS::SignIn.run(username: home.username, password: home.password)

    # returns a match object
    match = RPS::CreateInvite.run(session_key: home_sign_in, username: 'Wayne')
    session_key = RPS::SignIn.run(username: away.username, password: away.password)
    # will return a game
    game = RPS::AcceptInvite.run(session_key: session_key, username: home.username)
    result = RPS::PlayGame.run(session_key: session_key, mid: match, player_action: 'rock')

    expect(result.success?).to eq(true)
    expect(result.the_game.away_play).to eq('rock')


  end

  it 'assigns a game winner_id after one winner has won' do
    home = RPS.DB.create_user('Becky Brofloski', 'chicken parfait')
    away = RPS.DB.create_user('Wayne', 'Titty Crumbs')
    # returns session key UseCase object
    home_sign_in = RPS::SignIn.run(username: home.username, password: home.password)

    # returns a match object
    home_create_invite = RPS::CreateInvite.run(session_key: home_sign_in, username: 'Wayne')
    away_sign_in = RPS::SignIn.run(username: away.username, password: away.password)

    # will return a game
    game = RPS::AcceptInvite.run(session_key: away_sign_in, username: home.username)

    game_run_1 = RPS::PlayGame.run(session_key: away_sign_in, mid: home_create_invite, player_action: 'rock')
    game_run_2 = RPS::PlayGame.run(session_key: home_sign_in, mid: home_create_invite, player_action: 'scissors')

    expect(game_run_2.success?).to be_true
    expect(game_run_2.the_game.winner_id).to eq(away.id)

  end

  it 'assigns the correct match winner after he has won 3 games' do
    home = RPS.DB.create_user('Becky Brofloski', 'chicken parfait')
    away = RPS.DB.create_user('Wayne', 'Titty Crumbs')

    home_sign_in = RPS::SignIn.run(username: home.username, password: home.password)

    # returns a match object
    home_create_invite = RPS::CreateInvite.run(session_key: home_sign_in, username: 'Wayne')
    away_sign_in = RPS::SignIn.run(username: away.username, password: away.password)

    # will return a game
    game = RPS::AcceptInvite.run(session_key: away_sign_in, username: home.username)

    game_run_1 = RPS::PlayGame.run(session_key: away_sign_in, mid: home_create_invite, player_action: 'rock')
    game_run_2 = RPS::PlayGame.run(session_key: home_sign_in, mid: home_create_invite, player_action: 'scissors')

    game_run_3 = RPS::PlayGame.run(session_key: away_sign_in, mid: home_create_invite, player_action: 'rock')
    game_run_4 = RPS::PlayGame.run(session_key: home_sign_in, mid: home_create_invite, player_action: 'scissors')

    game_run_5 = RPS::PlayGame.run(session_key: away_sign_in, mid: home_create_invite, player_action: 'rock')
    result = RPS::PlayGame.run(session_key: home_sign_in, mid: home_create_invite, player_action: 'scissors')


    expect(result.success?).to eq(true)
    expect(result.the_match.winner_id).to eq(away.id)

  end

end
