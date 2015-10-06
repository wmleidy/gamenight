module ApplicationHelper

  def check_admin_status
    unless current_user.admin_privileges
      redirect_to game_path
    end
  end
end
