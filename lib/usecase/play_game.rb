module RPS
  class PlayGame < UseCase
    def run(inputs)

      #assign the session key to a variable
      user_session = inputs[:session_key]
      #assign the match id passed in by the client to a variable
      mid = inputs[:mid]
      #assign the players move to a variable
      player_action = inputs[:player_action]

      if (player_action != 'paper' && player_action != 'rock' && player_action != 'scissors')
        return failure(:incorrect_action)
      end
      #get the user id
      user_id = RPS.DB.get_session(user_session)

      #get the match
      match_find = RPS.DB.get_match(mid)
      return failure(:mid_doesnt_exist) if match_find.nil?
      #get the game
      game_find = RPS.DB.get_game(mid)
      the_game =  game_find.find{|game| game.winner_id == nil}
      #check to see if the player is home or away
      if (user_id == match_find.home_id)
        the_game.home_play = player_action
      else
        the_game.away_play = player_action
      end

      if (the_game.home_play != nil && the_game.away_play != nil)
        # victor = self.RPS_Referee(the_game.home_play, the_game.away_play)

       if (the_game.home_play == the_game.away_play)
        the_game.winner_id = 'Tie'
      elsif ((the_game.home_play == 'rock' && the_game.away_play == 'scissors') || (the_game.home_play == 'paper' && the_game.away_play == 'rock') || (the_game.home_play == 'scissors' && the_game.away_play == 'paper'))
        the_game.winner_id = match_find.home_id
      else
        the_game.winner_id = match_find.away_id
      end


        home_wins = game_find.select{|game| game.winner_id == match_find.home_id}.count

        away_wins = game_find.select{|game| game.winner_id == match_find.away_id}.count

        if (home_wins > 2)
          match_find.winner_id = match_find.home_id
        elsif (away_wins > 2)
          match_find.winner_id = match_find.away_id
        else
          new_game = RPS.DB.create_game(mid)
        end
      end
      success(the_game: the_game, the_match: match_find)
    end

  end
end
