class Round < ActiveRecord::Base
  belongs_to :deck
  belongs_to :user
  # Remember to create a migration!
end
