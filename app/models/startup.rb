class Startup
  attr_reader :name, :domain
  @@all = []
  def initialize(name,domain,founder_name)
    @founder_name = founder_name
    @name = name
    @domain = domain
    @@all << self
  end

  def founder
    @founder_name
  end

  def pivot=(domain, name)
    @domain = domain
    @name = name
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder_name)
    self.all.find do |startup|
      startup.name
    end
  end

  def sign_contract(venturecapitalist, type, investment)
    FundingRound.new(venturecapitalist, self, type, investment)
  end

  def num_funding_rounds
    array = FundingRound.all.select do |ele|
      ele.startup == self
    end
    array.count
  end

  def fundings
    FundingRound.all.select do |ele|
      ele.startup == self
    end
  end

  def total_funds
    fundings.map do |ele|
      ele.investment
    end.sum
  end

  def investors
    fundings.map do |ele|
      ele.venturecapitalist
    end
  end
#needs some work
  def big_investors
    new_array = []
    fundings.each do |ele|
      ele.venturecapitalist

      if ele.venturecapitalist == VentureCapitalist.tres_commas_club(100000000000)
        new_array << self
      end
    end
  end



end
