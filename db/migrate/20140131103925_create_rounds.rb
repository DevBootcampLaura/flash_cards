class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.belongs_to :user
      t.belongs_to :deck
      t.string :name
      t.boolean :complete
      t.timestamps
    end
  end
end
