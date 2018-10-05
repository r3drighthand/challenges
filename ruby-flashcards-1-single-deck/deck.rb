class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def choose_card(card_num = 0)
    cards[card_num]
    remove_card(card_num)
  end

  def remove_card(card_num = 0)
    cards.delete_at(card_num)
  end
end
