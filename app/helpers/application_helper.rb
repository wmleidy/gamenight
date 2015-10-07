module ApplicationHelper

  def check_admin_status
    unless current_user.admin_privileges
      redirect_to game_path
    end
  end

  def check_friend_status(user, buddy)
    Relationship.find_by(user_id: user,buddy_id: buddy)
  end
end
