module RPS
  class AcceptInvite < UseCase
    def run(inputs)
      user_session = inputs[:session_key]
      username = inputs[:username]

      #look for the user that has var username
      user_find = RPS.DB.list_users.find{|user| user.username == username}
      #return id of self.user
      session_decrypt = RPS.DB.get_session(user_session)
      #return matches that var username has invited
      match_select = RPS.DB.list_matches.select{|match| match.home_id == user_find.id }
      #find match that var username invited self.user to
      match_find = RPS.DB.list_matches.find{|match| match.away_id == session_decrypt}
      #create 1st round with respective match id
      spawn_game = RPS.DB.create_game(match_find.id)


      success(game: spawn_game)


    end
  end
end
