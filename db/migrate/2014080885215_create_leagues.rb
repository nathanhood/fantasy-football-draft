class CreateLeagues < ActiveRecord::Migration
  def change
    # In our original implementation:
    # CREATE TABLE IF NOT EXISTS skills(id INTEGER PRIMARY KEY AUTOINCREMENT, training_path_id INTEGER, name VARCHAR(29))
    create_table :leagues do |t|
      t.string :name
    end
  end
end
