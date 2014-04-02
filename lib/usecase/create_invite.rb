module RPS
  class CreateInvite < UseCase
    def run(inputs)
      away_username = inputs[:username]
      home_session_id = inputs[:session]
      check_userbase = RPS.DB.list_users.find{|user| user.username == away_username}
      # return failure(:user_doesnt_exist) if check_userbase.nil?
      home_verify = RPS.DB.get_session(home_session_id.session)

      match = RPS.DB.create_match(home_verify, check_userbase.id)

      success(match: match)


    end
  end
end
