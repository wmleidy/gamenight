class Comment < ActiveRecord::Base
  validates :body, presence: true
  validates :user_id, presence: true
  validates :game_id, presence: true

  belongs_to :user
  belongs_to :game
  has_many :votes, :as => :votable

  def vote_count
    self.votes.inject(0) { |total, vote| total += vote.value }
  end
end
