require 'csv'

module Parser

  def self.parse(file, name)
    deck = Deck.create(:name => name)
    CSV.foreach(File.open(filename=File.dirname(__FILE__) + "/../db/#{file}"), :headers => true, :header_converters => :symbol) do |row|
      deck.cards << Card.create(:question => row[:question], :answer => row[:answer])
    end
  end
end

Parser.parse('state_capitals.csv', "State Capitals")

Parser.parse('state_nicknames.csv', "State Nicknames")


(1..20).each {|num| Guess.create(card_id: num, guess: "Springfield", round_id: 1)}

User.create(name: "Danny")
Round.create(name: 'Game', user_id: 1, deck_id: 1)
