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
