class CreateLeagues < ActiveRecord::Migration
  def change
    # In our original implementation:
    # CREATE TABLE IF NOT EXISTS skills(id INTEGER PRIMARY KEY AUTOINCREMENT, training_path_id INTEGER, name VARCHAR(29))
    create_table :leagues do |t|
      t.string :name
      t.integer :draft_round, default: 0
      t.integer :round_position, default: -1
    end
  end
end
