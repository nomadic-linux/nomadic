class Reward
  include Redis::Objects
  def initialize *r
    if r[0]
      @id = r[0]
    else
      rr = []
      16.times { rr << rand(9) }
      @id = rr.join('')
    end
  end
  def id; @id; end
end
end

