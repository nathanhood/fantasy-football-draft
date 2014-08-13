class CreatePlayers < ActiveRecord::Migration
  def change
    # In our original implementation:
    # CREATE TABLE IF NOT EXISTS skills(id INTEGER PRIMARY KEY AUTOINCREMENT, training_path_id INTEGER, name VARCHAR(29))
    create_table :players do |t|
      t.string :name
      t.string :position
      t.string :nfl_team
      t.integer :rank
      t.references :team, default: nil
    end
  end
end
