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

    def create_match()
      match = Match.new
      @matches[match.id] = match
      match
    end

    def get_match(mid)
      @matches[mid]
    end

     def create_game()
    game = Game.new
    @games[game.id] = game
    game
  end

  def get_game(mid)
    @games[gid]
  end

  end
end
