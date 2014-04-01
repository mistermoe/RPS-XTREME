module RPS
  class SignUp < UseCase
    def run(inputs)
      username = inputs[:username]
      password = inputs[:password]

      user_check = RPS.DB.list_users.find{|user| user.username == username}

      if (user_check != nil)
        return failure(:user_already_exists)
      else
        user = RPS.DB.create_user(username, password)
      end

      success(user: user)


    end
  end
end
