module RPS
  class SignIn < UseCase
    def run(inputs)
      username = inputs[:username]
      password = inputs[:password]
      check_users = RPS.DB.list_users.find{|user| user.username == username}
      return failure(:username_doesnt_exist) if check_users.nil?

      if (check_users.password == password)
        session = RPS.DB.create_session(check_users.id)
      else
        return failure(:incorrect_password)
      end
      success(session_key: session.id)
    end
  end
end
