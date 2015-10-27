class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login
  # scope :pending, -> { where(self.buddies.status == 0)}
  # scope :mutual, -> { where(self.buddies.status == 1)}

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
      users = where('LOWER(username) LIKE ?', "%#{username}%")
      return users
    else
      all
    end
  end

  def mutual
    buddy_ids = self.relationships.where(status: 1)
    @buddies = []

    buddy_ids.each do |buddy|
      @buddies << User.find(buddy.buddy_id)
    end

    @buddies
  end

  def pending
    buddy_ids = self.relationships.where(status: 0)
    @buddies = []

    buddy_ids.each do |buddy|
      @buddies << User.find(buddy.buddy_id)
    end

    @buddies
  end

  def requests
    buddy_ids = Relationship.where(buddy_id: self.id).select { |relationship| relationship.status == 0}

    @buddies = []

    buddy_ids.each do |buddy|
      @buddies << User.find(buddy.user_id)
    end

    @buddies
  end

  private

  def set_avatar
    self.avatar_url ||= Faker::Avatar.image
  end

  def set_username
    num = rand(1..10000)
    self.username ||= "BoardGamer#{num}"
  end
end
