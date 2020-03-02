# frozen_string_literal: true

require_relative './deck'
require_relative './playing_card'

class PlayingCardDeck < Deck
  SUITS = %w[clubs spades hearts diamonds].freeze
  VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

  def initialize
    super
    @cards = create_deck
    shuffle
  end

  def create_deck
    deck = []

    SUITS.each do |suit|
      VALUES.each do |value|
        deck << PlayingCard.new(suit, value)
      end
    end

    deck
  end

  def deal_poker_hands(count)
    poker_hands = []

    count.times do
      hand = []

      5.times do
        hand << deal
      end

      poker_hands << hand
    end

    poker_hands
  end
end
