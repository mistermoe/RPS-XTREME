module RPS
  class User
    attr_reader :id, :username, :password
    attr_accessor :win_count, :matches_played
    @@counter = 0
    def initialize(username, password)
      @username = username
      @password = password
      @@counter += 1
      @id = @@counter
      @win_count = 0
      @matches_played = 0
    end
  end
end
