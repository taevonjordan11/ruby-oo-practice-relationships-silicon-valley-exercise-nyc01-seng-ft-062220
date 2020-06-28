class FundingRound
  attr_reader :startup, :venturecapitalist, :type

  @@all = []
  def initialize(venturecapitalist, startup, type, investment)
    @venturecapitalist = venturecapitalist
    @startup = startup
    @type = type
    @investment = investment
    @@all << self
  end

  def self.all
    @@all
  end

  def investment
    @investment.to_f
  end

end
