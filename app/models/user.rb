class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :votes
  has_many :games, through: :libraries
  has_many :desired_games
  has_many :wanted_games, through: :desired_games
  has_many :owned_games
  has_many :games, through: :owned_games
  has_many :buddies, through: :relationships

  before_validation :set_avatar, on: :create

  private

  def set_avatar
    self.avatar_url ||= Faker::Avatar.image
  end
end
