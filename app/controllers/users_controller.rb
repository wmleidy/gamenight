class UsersController < ApplicationController
  include ApplicationHelper

  def index
    @user = User.search(params[:search])
    if @user
      redirect_to user_path(@user)
    else
      @error = "User not found"
      redirect_to user_path(current_user)
    end
  end

  def show(partial = "")
    @user = User.find(params[:id])
    if current_user == nil
      redirect_to new_user_session_path
    else
      case partial
      when 'buddies'
      when 'games'
      when 'wanted games'
        render :'users/_user_wan'
      else
        render :'users/show'
      end
    end
  end

  def buddies
    @user = User.find(params[:id])
    @buddy = User.find(params[:buddy])

    if @user.id == @buddy.id
      @error = "You're not able to add yourself as a buddy"
    elsif Relationship.find_by(user_id: @user.id, buddy_id: @buddy.id)
      @error = "This user is already your buddy"
    else
      Relationship.create!(user_id: @user.id, buddy_id: @buddy.id)
      redirect_to user_path(@user)
    end
  end

  def owned_games
    @user = User.find(params[:id])
    @game = Game.find(params[:game])

    if OwnedGame.find_by(owner_id: @user.id, game_id: @game.id)
      @error = "You already own this game"
      render :"games/index"
    else
      OwnedGame.create!(owner_id: @user.id, game_id: @game.id)
      redirect_to games_path
    end
  end

  def wanted_games
    @user = User.find(params[:id])
    @game = Game.find(params[:wanted_game])

    if DesiredGame.find_by(wanter_id: @user.id, wanted_game_id: @game.id)
      @error = "You already have this game in your wishlist"
      render :"games/index"
    else
      DesiredGame.create!(wanter_id: @user.id, wanted_game_id: @game.id)
      redirect_to games_path
    end
  end

end

