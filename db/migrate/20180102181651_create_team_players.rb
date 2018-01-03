class CreateTeamPlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :team_players do |t|
      t.belongs_to :player, foreign_key: true
      t.belongs_to :team, foreign_key: true

      t.timestamps
    end
  end
end
