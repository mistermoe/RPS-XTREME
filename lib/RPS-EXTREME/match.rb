module RPS
  class Match
    @@counter = 0
    attr_accessor :home_id, :away_id, :winner_id
    attr_reader :id
    def initialize(home_id=nil, away_id=nil, winner_id=nil)
      @id = @@counter += 1
      @home_id = home_id
      @away_id = away_id
      @winner_id = winner_id
    end
  end
end
