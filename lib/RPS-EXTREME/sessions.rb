module RPS
  class Sessions
    @@counter = 0
    attr_reader :id
    attr_accessor :uid

    def initialize(uid)
      @uid = uid
      @@counter += 1
      @id = @@counter
    end
  end
end
