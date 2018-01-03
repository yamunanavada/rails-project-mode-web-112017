class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.belongs_to :team, foreign_key: true
      t.belongs_to :opponent, foreign_key: true

      t.timestamps
    end
  end
end
