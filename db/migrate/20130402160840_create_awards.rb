class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.references :user
      t.references :tournament
      t.integer :amount
      t.string :username, :default => ""

      t.timestamps
    end
    add_index :awards, :user_id
    add_index :awards, :tournament_id
  end
end
