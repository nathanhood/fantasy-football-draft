class Team < ActiveRecord::Base
  validates_presence_of :name, :league
  belongs_to :league
  has_many :players

end
