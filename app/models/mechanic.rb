class Mechanic < ActiveRecord::Base
  validates :trait, presence: true

  has_many :game_features
  has_many :games, through: :game_features
end
