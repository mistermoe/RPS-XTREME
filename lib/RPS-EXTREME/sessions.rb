module RPS
  class Sessions
    @@counter = 0
    attr_reader :id

    def initialize(uid)
      @@counter += 1
      @id = @@counter
    end
  end
end
