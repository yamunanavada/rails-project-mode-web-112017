class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :speed
      t.integer :accuracy
      t.integer :price

      t.timestamps
    end
  end
end
