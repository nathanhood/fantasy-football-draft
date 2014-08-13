class League < ActiveRecord::Base
  validates_presence_of :name, message: "cannot be blank.\nMust enter a league name when program is executed.\nPlease try again."
  has_many :teams
end
