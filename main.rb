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
  
  private
  
  def build_deck
    SUITS.each do |suit|
      VALUES.each do |value|
        @hidden_cards << Card.new(suit, value)
      end
    end
  end
end

class Card
  attr_reader :suit, :value
  
  def initialize(suit, value)
    @suit = suit
    @value = value
  end
end
