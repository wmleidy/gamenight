class CommentsController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_user!

  def create
  	@game = Game.find(params[:id])
  	@comment = Comment.new(comment_params)
  	@comment.assign_attributes(user_id: current_user.id, game_id: params[:id])
  	if @comment.save
  		redirect_to game_path(@game)
  	else
  		render :"games/show"
  	end
  end


  private

  def comment_params
  	params.require(:comment).permit(:body)
  end
end