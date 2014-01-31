require 'csv'

module Parser

  def self.parse(file, id)
    CSV.table(file, :header_converters => :symbol).each do |row|
      # p row #= row.to_hash
      # p row[:question], row[:answer], id
      # p row.to_hash Just in case the previous line doesn't work
      Card.create(:question => row[:qustion], :answer => row[:answer], :deck_id => id)
    end
  end
end

first_deck = Deck.create(:name => "State Capitals")
id = first_deck.id
Parser.parse('state_capitals.csv', id)

second_deck = Deck.create(:name => "State Nicknames")
id = second_deck.id
Parser.parse('state_nicknames.csv', id)
