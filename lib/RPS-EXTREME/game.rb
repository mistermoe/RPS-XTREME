module RPS
  class Game
    @@counter = 0
    attr_accessor :match_id, :winner_id, :home_play, :away_play
    attr_reader :id
    def initialize(match_id=nil, winner_id=nil, home_play=nil, away_play=nil)
      @id = @@counter += 1
      @match_id = match_id
      @winner_id = winner_id
      @home_play = home_play
      @away_play = away_play
    end
  end
end
