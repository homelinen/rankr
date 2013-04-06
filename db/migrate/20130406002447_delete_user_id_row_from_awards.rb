class DeleteUserIdRowFromAwards < ActiveRecord::Migration
  def up
    remove_index :awards, :user_id
    remove_column :awards, :user_id
  end

  def down
    add_column :awards, :user_id, :integer
    add_index :awards, :user_id
  end
end
