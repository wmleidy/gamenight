class OwnedGame < ActiveRecord::Base
  belongs_to :owner, class_name: User
  belongs_to :game

  validates :owner_id, presence: true
  validates :game_id, presence: true
end
