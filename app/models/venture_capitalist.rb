class VentureCapitalist
  attr_accessor :name
  attr_reader :total_worth

  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club(total_worth)
    self.all.find_all do |element|
      element.total_worth > 1000000
    end
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(self, startup, type, investment)
  end

  def funding_rounds
    FundingRound.all.select do |ele|
      ele.venturecapitalist == self
    end
  end

  def portfolio
    funding_rounds.map do |ele|
      ele.startup
    end
  end

  def biggest_investment
    funding_rounds.max_by do |ele|
      ele.investment
    end
  end

end
