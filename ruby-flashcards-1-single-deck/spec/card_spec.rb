require_relative '../card'

describe Card do
  let(:card) { Card.new({
      question: "What is a nighthawk's primary food source?",
      answer: "insects"
    }) }

  it 'has a question' do
    expect(card.question).to eq "What is a nighthawk's primary food source?"
  end

  it 'has an answer' do
    expect(card.answer).to eq "insects"
  end
end
