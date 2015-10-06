class GamesController < ApplicationController
  include ApplicationHelper

  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new]
  before_filter :check_admin_status, :only => [:edit, :update, :destroy]

  def index
    @games = Game.all
  end

  def show
    @comments = @game.comments
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @game.update(game_params)
      redirect_to game_path(@game)
    else
      render :edit
    end
  end

  def destroy
    @game.destroy
    redirect_to games_path
  end

  private
  def set_games
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:title, :description, :min_players, :max_players, :average_time, :image_url, :mechanics)
  end


end
