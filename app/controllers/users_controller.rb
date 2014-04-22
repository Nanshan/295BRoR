class UsersController < ApplicationController

  # exposed for ease of testing only
  def index
    @users = User.order("id").page(params[:page]).per(50)        
  end

  # for showing user profile data
  def show
    @user = User.where(["lower(\"userName\") = ?", params[:name].downcase]).first
    @profile = Profile.where(["\"userId\" = ?", @user.id.to_s]).first
  end

  def login
    @result = false
    @user = User.where(["lower(\"userName\") = ?", params[:userName].downcase]).first
    if (@user != nil and @user.password == params[:password])
      @result = true
    end
  end

  def register
    @result = false
    @existingUser = User.where(["lower(\"userName\") = ?", params[:userName].downcase]).first
    if (@existingUser == nil)
      @user = User.new
      @user.userName = params[:userName].downcase
      @user.password = params[:password]
      @user.email = params[:email].downcase
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
