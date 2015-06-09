#!/usr/bin/env ruby

# YOUR CODE HERE
require_relative "card.rb"
require '../lib/deck'
require '../lib/hand'

class Game
  attr_reader :player, :dealer, :deck

  def initialize
    @deck = Deck.new
    @player = Hand.new
    @dealer = Hand.new
  end

  def deal
    2.times do
    player.hand << deck.draw!
    dealer.hand << deck.draw!
    end
  end

  def hit!(user)
    user.hand << deck.draw!
  end

  def display(user)
    hand = ""
      user.hand.each { |c| hand << "#{c.card} " }
    hand
  end

  def prompt
    while player.card_count <= 21
      puts "Dealer is showing (#{dealer.hand[0].card})"
      puts "Player has #{display(player)}"
      puts "Total: #{player.card_count}"
      print "Hit(h) or Stand(s):"
        players_choice = gets.chomp.downcase
          if players_choice == 'h'
            hit!(player)
          elsif players_choice == 's'
            break
          else
            "please choose (h) or (s)"
          end
    end
  end

  def outcomes
    if !player.bust? && !dealer.bust?
      if player.card_count > dealer.card_count
        puts "Player WINS"
      elsif player.card_count == dealer.card_count
        puts "Push"
      else
        puts "Dealer wins"
      end
    elsif !player.bust? && dealer.bust?
      puts "Dealer BUSTS, Player WINS"
    else
      puts "Player Busts, better luck next time"
    end
  end

  def dealers_prompt
      puts "You have #{player.card_count}"
    while true
        until dealer.card_count >= 17
          hit!(dealer)
        end
      puts "Dealer has #{display(dealer)}"
      puts "Total: #{dealer.card_count}"
      break
    end
  end

  def again?
    puts "play again? Y/N"
    input = gets.chomp.downcase
    if input == 'y'
      runner
    end
  end

  def runner
    initialize
    deal
    prompt
    dealers_prompt
    outcomes
    again?
  end
end

bj = Game.new
bj.runner
