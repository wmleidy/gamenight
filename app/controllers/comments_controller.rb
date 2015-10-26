class CommentsController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_user!

  def create
  	@game = Game.find(params[:id])
  	@comment = Comment.new(comment_params)
  	@comment.assign_attributes(user_id: current_user.id, game_id: params[:id])
  	if request.xhr?
      @comment.save
      # implicit call to create.js.erb
    elsif @comment.save
  		redirect_to game_path(@game)
  	else
  		render :"games/show"
  	end
  end

  def upvote
    @comment = Comment.find(params[:id])
    @game = @comment.game
    @vote = Vote.find_or_initialize_by(user_id: current_user.id, votable_type: "Comment", votable_id: @comment.id)
    new_value = @vote.value + 1
    @vote.assign_attributes(value: new_value)
    @vote.save
    redirect_to game_path(@game)
  end

  def downvote
    @comment = Comment.find(params[:id])
    @game = @comment.game
    @vote = Vote.find_or_initialize_by(user_id: current_user.id, votable_type: "Comment", votable_id: @comment.id)
    new_value = @vote.value - 1
    @vote.assign_attributes(value: new_value)
    @vote.save
    redirect_to game_path(@game)
  end


  private

  def comment_params
  	params.require(:comment).permit(:body)
  end
end