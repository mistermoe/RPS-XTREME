require 'spec_helper'
describe RPS::PlayGame do
  it 'fuckin plays the game' do

    home = RPS.DB.create_user('Becky Brofloski', 'chicken parfait')
    away = RPS.DB.create_user('Wayne', 'Titty Crumbs')

    home_session = RPS.DB.create_session(home.id)
    away_session = RPS.DB.create_session(away.id)

    match = RPS.DB.create_match(1, 2)

    game = RPS.DB.create_game(match.id)

    result = RPS::PlayGame.run(session_key: away_session.id, mid: match.id, player_action: 'rock')
    expect(result.success?).to eq(true)
    expect(result.the_game.away_play).to eq('rock')


  end

  it 'assigns a game winner_id after one winner has won' do
    home = RPS.DB.create_user('Becky Brofloski', 'chicken parfait')
    away = RPS.DB.create_user('Wayne', 'Titty Crumbs')

    home_session = RPS.DB.create_session(home.id)
    away_session = RPS.DB.create_session(away.id)

    match = RPS.DB.create_match(1, 2)


    # will return a game
    game = RPS.DB.create_game(match.id)

    game_run_1 = RPS::PlayGame.run(session_key: away_session.id, mid: match.id, player_action: 'rock')
    game_run_2 = RPS::PlayGame.run(session_key: home_session.id, mid: match.id, player_action: 'scissors')

    expect(game_run_2.success?).to be_true
    expect(game_run_2.the_game.winner_id).to eq(away.id)

  end

  it 'assigns the correct match winner after he has won 3 games' do
    home = RPS.DB.create_user('Becky Brofloski', 'chicken parfait')
    away = RPS.DB.create_user('Wayne', 'Titty Crumbs')

    home_session = RPS.DB.create_session(home.id)
    away_session = RPS.DB.create_session(away.id)

    match = RPS.DB.create_match(1, 2)


    # will return a game
    game = RPS.DB.create_game(match.id)

    game_run_1 = RPS::PlayGame.run(session_key: away_session.id, mid: match.id, player_action: 'rock')
    game_run_2 = RPS::PlayGame.run(session_key: home_session.id, mid: match.id, player_action: 'scissors')

    game_run_3 = RPS::PlayGame.run(session_key: away_session.id, mid: match.id, player_action: 'rock')
    game_run_4 = RPS::PlayGame.run(session_key: home_session.id, mid: match.id, player_action: 'scissors')

    game_run_5 = RPS::PlayGame.run(session_key: away_session.id, mid: match.id, player_action: 'rock')
    result = RPS::PlayGame.run(session_key: home_session.id, mid: match.id, player_action: 'scissors')


    expect(result.success?).to eq(true)
    expect(result.the_match.winner_id).to eq(away.id)

  end

  it 'throws an error if user enters an action other than rock paper or scissors' do
    home = RPS.DB.create_user('Becky Brofloski', 'chicken parfait')
    away = RPS.DB.create_user('Wayne', 'Titty Crumbs')

    home_session = RPS.DB.create_session(home.id)
    away_session = RPS.DB.create_session(away.id)

    match = RPS.DB.create_match(1, 2)


    # will return a game
    game = RPS.DB.create_game(match.id)

    result = RPS::PlayGame.run(session_key: away_session.id, mid: match.id, player_action: 'milk')
    expect(result.error?).to eq(true)
    expect(result.error).to eq(:incorrect_action)
  end

  it 'throws an error if user enters a match id that doesn\'t exist' do
    home = RPS.DB.create_user('Becky Brofloski', 'chicken parfait')
    away = RPS.DB.create_user('Wayne', 'Titty Crumbs')

    home_session = RPS.DB.create_session(home.id)
    away_session = RPS.DB.create_session(away.id)

    match = RPS.DB.create_match(1, 2)

    game = RPS.DB.create_game(match.id)

    result = RPS::PlayGame.run(session_key: away_session.id, mid: 38490238409238490328, player_action: 'rock')

    expect(result.error?).to eq(true)
    expect(result.error).to eq(:mid_doesnt_exist)
  end

end
