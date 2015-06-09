
class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def card
    "#{rank} #{suit}"
  end

  def face_card?
    ["J", "Q", "K"].include?(@rank)
  end

  def value
    if ["J", "Q", "K"].include?(@rank)
      10
    elsif @rank == 'A'
      11
    else
      @rank.to_i
    end
  end
end
