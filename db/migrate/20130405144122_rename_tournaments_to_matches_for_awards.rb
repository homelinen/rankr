class RenameTournamentsToMatchesForAwards < ActiveRecord::Migration
  def up
    rename_index :awards, :tournament_id, :match_id
    rename_column :awards, :tournament_id, :match_id
  end

  def down
    rename_column :awards, :match_id, :tournament_id
    rename_index :awards, :match_id, :tournament_id
  end
end
