class UsersController < ApplicationController

  # exposed for ease of testing only
  def index
    @users = User.order("id").page(params[:page]).per(50)        
  end

  # for showing user profile data
  def show
    @user = User.where(["userName = ?", params[:name]]).first
    @profile = Profile.where(["userId = ?", @user.id]).first    
  end

  def login
    @result = false
    @user = User.where(["userName = ?", params[:userName]]).first
    if (@user != nil and @user.password == params[:password])
      @result = true
    end
  end

  def register
    @result = false
    @existingUser = User.where(["userName = ?", params[:userName]]).first
    if (@existingUser == nil)
      @user = User.new
      @user.userName = params[:userName]
      @user.password = params[:password]
      @user.email = params[:email]
      if (@user.save)
        @result = true

	# create profile
	@profile = Profile.new
	@profile.userId = @user.id
	@profile.email = @user.email
	@profile.save
      end
    end
  end

end
