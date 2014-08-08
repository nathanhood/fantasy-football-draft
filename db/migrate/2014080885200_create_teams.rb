class CreateTeams < ActiveRecord::Migration
  def change
    # In our original implementation:
    # CREATE TABLE IF NOT EXISTS skills(id INTEGER PRIMARY KEY AUTOINCREMENT, training_path_id INTEGER, name VARCHAR(29))
    create_table :teams do |t|
      t.string :name
      t.boolean :commissioner
      t.references :league
    end
  end
end
