class DesiredGame < ActiveRecord::Base
  belongs_to :wanter, class_name: User
  belongs_to :wanted_game, class_name: Game

  validates :wanter_id, presence: true
  validates :wanted_game_id, presence: true
end
