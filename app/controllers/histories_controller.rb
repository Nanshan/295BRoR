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
    @user_id = User.where(["lower(\"userName\") = ?", params[:userName].downcase]).first.id
    @history = History.new
    @history.userId = @user_id
    @history.placeID = params[:placeID]
    @history.like = params[:like]
    @history.save
  end
end
