require_relative '../deck'

describe Deck do
  let(:card_1) {Card.new({
      question: "What is a nighthawk's primary food source?",
      answer: "insects"
    })}

  let(:card_2) {Card.new({question: "True or false?  Nighthawks are closely related to hawks.", answer: "false"})}

  let(:deck) {Deck.new([card_1, card_2])}

  it 'has an array of new cards' do
    expect(deck.cards).to be_a(Array)
    expect(deck.cards.length).to eq 2
  end

  it 'returns the first question in list' do
    expect(deck.choose_card).to eq card_1
  end
end
