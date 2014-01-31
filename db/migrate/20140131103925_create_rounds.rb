class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.belongs_to :user
      t.belongs_to :deck
      t.text :record
      t.string :name
      t.timestamps
    end
  end
end
