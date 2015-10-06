class Game < ActiveRecord::Base
  validates :title, presence: true
  validates :image_url, presence: true

  before_validation :set_image, on: :create

  has_many :comments
  has_many :votes, :as => :votable
  has_many :game_features
  has_many :mechanics, through: :game_features
  has_many :owned_games
  has_many :owners, through: :owned_games
  has_many :desired_games, foreign_key: "wanted_game_id"
  has_many :wanters, through: :desired_games

  private

  def set_image
    self.image_url ||= "/app/assets/images/default-image.png"
  end
end
