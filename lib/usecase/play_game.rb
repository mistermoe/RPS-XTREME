module RPS
  class PlayGame < UseCase
    def run(inputs)

      user_session = inputs[:session_key]
      mid = inputs[:mid]
      player_action = inputs[:player_action]

      #get the user id
      user_id = RPS.DB.get_session(user_session.session_key)

      #get the match
      match_find = RPS.DB.get_match(mid.match.id)
      #get the game
      game_find = RPS.DB.get_game(mid.match.id)

      the_game =  game_find.find{|game| game.winner_id == nil}

      #check to see if the player is home or away
      if (user_id == match_find.home_id)
        the_game.home_play = player_action
      else
        the_game.away_play = player_action
      end

      if (the_game.home_play != nil && the_game.away_play != nil)
        victor = RPS_Referee(the_game.home_play, the_game.away_play)
        home_wins = game_find.select{|game| game.winner_id == match_find.home_id}.count

        away_wins = game_find.select{|game| game.winner_id == match_find.away_id}.count

        if (home_wins > 2)
          match_find.winner_id = match.home_id
        elsif (away_wins > 2)
          match_find.winner_id = match.away_id
        else
          new_game = RPS.DB.create_game(mid.match.id)
        end
      end
      success(victor: victor, the_game: the_game)

    end
    def RPS_Referee(home_play, away_play)
      if (home_play == away_play)
        the_game.winner_id = 'Tie'
      elsif ((home_play == 'rock' && away_play == 'scissors') || (home_play == 'paper' && away_play == 'rock') || (home_play = 'scissors' && away_play = 'paper'))
        the_game.winner_id = match_find.home_id
      else
        the_game.winner_id = mind_find.away_id
      end
      victor = the_game.winner_id
      victor
    end
  end
end
