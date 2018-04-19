#!/bin/ruby

class Game
  
end

class Deck
  attr_reader :active_cards
  
  SUITS = %i[red yellow blue green purple]
  VALUES = (0..10).to_a
  
  def initialize
    @hidden_cards = build_deck
    @active_cards = []
  end
  
  def shuffle
    @hidden_cards.shuffle!
  end
  
  def remaining_cards
    @hidden_cards.count
  end
  
  def pop
    top_card = @hidden_cards.pop
    @active_cards << top_card
    top_card
  end

  def to_s
    @hidden_cards.to_s
  end
  
  private
  
  def build_deck
    cards = []
    SUITS.each do |suit|
      VALUES.each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards
  end
end

class Card
  attr_reader :suit, :value
  
  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def to_s
    "#{value} of #{suit}"
  end
end

deck = Deck.new
deck.shuffle
puts deck.to_s