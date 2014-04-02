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
      @sessions = {}
    end

    def create_user(username, password)
      user = User.new(username, password)
      @users[user.id] = user
      user
    end

    def get_user(uid)
      @users[uid]
    end

    def create_match(hid, aid)
      match = Match.new(hid, aid)
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

  def get_game(gid)
    @games[gid]
  end

  def list_users
    @users.values
  end

  def create_session(uid)
    session = Sessions.new(uid)
    @sessions[session.id] = uid
    session
  end

  def get_session(sid)
    @sessions[sid]
  end

  end
end
