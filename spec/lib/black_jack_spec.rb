require_relative "../../lib/blackjack.rb"

describe Card do

  describe "initialize" do
    let(:card) {Card.new('J', '♠︎')}

    it "should initialize a card object" do
      expect(card).to be_a Card
    end

    describe "#face_card?" do
      context "face card" do
        it "should return true if card is a 'K', 'Q', or 'J'" do
          expect(card.face_card?).to eq (true)
        end
      end
    end
  end

  describe "#face_card?" do
    context "non face card" do
      it "should return false if card is anything other than 'K', 'Q', or 'J'" do
        expect(Card.new('A', '♠︎').face_card?).to eq (false)
      end
    end
  end

  describe "#value" do
    context "non face card" do
      it "should return 10 for any face card, 11 for aces, and number value" do
        expect(Card.new('A', '♠︎').value).to eq (11)
        expect(Card.new('9','♠︎').value).to eq (9)
        expect(Card.new('J','♠︎').value).to eq (10)
      end
    end
  end
end

describe Deck do

  describe "initialize" do
    let(:deck) {Deck.new}

    it "should initialize a deck object" do
      expect(deck).to be_a Deck
    end

    it "should have 52 cards in the deck" do
      expect(deck.collection.size).to eq (52)
    end

    # describe '#draw!' do
    #   it "should draw a card from the deck" do
    #     expect(deck.draw!).to be_a Card
    #   end
    # end
  end
end

describe Hand do
    let(:hand) {Hand.new}

  describe 'initialize' do

    it "should initialize a hand" do
      expect(hand).to be_a Hand
    end
  end
end

describe Game do

  describe 'initialize' do
    it "should initialize a game" do
      expect(Game.new).to be_a Game
    end
  end
end
