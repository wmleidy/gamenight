class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :votes
  has_many :desired_games, foreign_key: "wanter_id"
  has_many :wanted_games, through: :desired_games
  has_many :owned_games, foreign_key: "owner_id"
  has_many :games, through: :owned_games
  has_many :relationships
  has_many :buddies, through: :relationships

  before_validation :set_avatar, on: :create
  before_validation :set_username, on: :create

  def self.search(username)
    if username
      username.downcase!
      user = where('LOWER(username) LIKE ?', "%#{username}%")
      user[0]
    else
      all
    end
  end

  private

  def set_avatar
    self.avatar_url ||= Faker::Avatar.image
  end

  def set_username
    self.username ||= Faker::Internet.user_name
  end
end
