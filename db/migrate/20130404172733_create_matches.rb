class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :name
      t.references :tournament
      t.string :game
      t.datetime :start
      t.integer :duration

      t.timestamps
    end
    add_index :matches, :tournament_id
  end
end
