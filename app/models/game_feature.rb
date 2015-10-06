class GameFeature < ActiveRecord::Base
  validates :game_id, presence: true
  validates :mechanic_id, presence: true

  belongs_to :game
  belongs_to :mechanic
end
