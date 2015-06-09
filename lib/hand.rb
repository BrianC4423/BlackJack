require 'lib/card.rb'
require 'lib/deck.rb'
class Hand
  attr_accessor :hand
  def initialize
    @hand = []
  end

  def card_count
    total = 0
      @hand.each { |card| total += card.value }
    total
  end

  def bust?
    if card_count > 21
      true
    else
      false
    end
  end
end
