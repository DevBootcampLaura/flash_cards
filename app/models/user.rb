class User < ActiveRecord::Base
  has_many :rounds
  has_many :decks, :through => :round
  # Remember to create a migration!
end
