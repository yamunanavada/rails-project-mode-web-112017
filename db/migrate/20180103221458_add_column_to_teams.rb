class AddColumnToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :war_chest, :integer
  end
end
