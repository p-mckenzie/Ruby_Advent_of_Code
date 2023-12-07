require_relative '../Base'

module Y2023
  class Hand
    attr_accessor :cards
  
    def initialize(cards)
      @cards = cards
    end

    def type
      counts = @cards.chars.group_by(&:itself).transform_values(&:count)
      
      if counts.length == 1 then
        # five of a kind
        7
      elsif counts.length == 2 and counts.values.max==4 then
        # four of a kind
        6
      elsif counts.length==2 and counts.values.max==3 then
        # full house
        5
      elsif counts.length==3 and counts.values.max==3 then
        # three of a kind
        4
      elsif counts.length==3 and counts.values.max==2 then
        # two pair
        3
      elsif counts.length==4 and counts.values.max==2 then
        # one pair
        2
      else
        1
      end
    end

    def card_order(order)
      (0...5).map {|i| order.length - order.index(@cards[i]) }
    end

    def strength(order)
      return [type] + card_order(order)
    end
  end

  class Day07 < Base
    @@day = 7
    @@year = 2023

    def initialize(data=get_data)
      @data = data.split("\n").map {
        |line|
        hand, bid = line.split(" ")
        [Hand.new(hand), bid.to_i]
      }.to_h
    end

    def part_1
      order = ["A", "K", "Q", "J", "T", "9", "8", "7", "6", "5", "4", "3", "2"]

      ranks = @data.sort_by {|hand, bid| hand.strength(order) }

      ranks.each_with_index.map {
        |data, i|
        hand, bid = data
        bid * (i+1)
      }.sum
    end

    def handle_jokers(hand, order)
      joker_loc = hand.cards.index('J')

      if joker_loc then
        order.map {
          |card|
          if card== 'J' then next end
          possible_cards = hand.cards.clone
          possible_cards[joker_loc] = card
          possible_hand = Hand.new(possible_cards)
          handle_jokers(possible_hand, order)
          }.flatten.compact
      else
        [hand]
      end
    end

    def part_2
      order = ["A", "K", "Q", "T", "9", "8", "7", "6", "5", "4", "3", "2", "J"]

      best_hand = @data.map {
        |hand, bid|
        [hand, 
          handle_jokers(hand, order).sort_by {
            |possible_hand|
            possible_hand.strength(order)
        }.last
        ]
      }.to_h

      ordered = best_hand.sort_by {
        |hand, best_hand| 
        [best_hand.type, hand.card_order(order)]
      }.map(&:first)
      
      ordered.each_with_index.map {
        |hand, index|
        @data[hand] * (index+1)
      }.sum
    end
  end
end

executable = Y2023::Day07.new
executable.run
