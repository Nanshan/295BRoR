class UsersController < ApplicationController

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
      end
    end
  end

end
