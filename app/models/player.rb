class Player < ActiveRecord::Base
  validates_presence_of :name, :position, :rank, :nfl_team
  belongs_to :team
end
