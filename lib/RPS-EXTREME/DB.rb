module RPS
  def self.DB
    @__db ||= DB.new
  end

  class DB
    attr_accessor :users, :matches, :games
    def initialize
      @users = {}
      @matches = {}
      @games = {}
    end

    def create_user(username, password)
      user = User.new(username, password)
      @users[user.id] = user
      user
    end

    def get_user(uid)
      @users[uid]
    end


  end
end
