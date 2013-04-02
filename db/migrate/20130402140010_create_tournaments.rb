class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.references :user
      t.date :start

      t.timestamps
    end
    add_index :tournaments, :user_id
  end
end
