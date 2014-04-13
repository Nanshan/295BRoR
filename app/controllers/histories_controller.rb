class HistoriesController < ApplicationController
  # GET /histories
  # GET /histories.json
  def index
    @histories = History.all
  end

  # GET /histories/1
  # GET /histories/1.json
  def show
  end

  # POST /histories
  # POST /histories.json
  def create
    @user_id = User.where(["userName = ?", params[:userName]]).first.id
    @history = History.new(userId: @user_id, latitude: params[:latitude], longitude: params[:longitude], like: params[:like])
    @history.save
  end
end
