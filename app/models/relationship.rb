class Relationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :buddy, class_name: User

  validates :user_id, presence: true
  validates :buddy_id, presence: true

  # 0 for pending relationship, 1 for accepted
  # (in future, could add 2 and 3 for declined and blocked, respectively)
  validates :status, presence: true, :inclusion => {:in => [0,1]}

end
