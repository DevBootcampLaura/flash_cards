class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.belongs_to :card
      t.belongs_to :round
      t.string :guess
      t.timestamps
    end
  end
end
