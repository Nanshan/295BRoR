class UsersController < ApplicationController

  def login
    @result = "Failure"
    @user = User.where(["userName = ?", params[:userName]]).first
    if (@user != nil and @user.password == params[:password])
      @result = "Success"
    end
  end

  def register
    @result = "Failure"
    @existingUser = User.where(["userName = ?", params[:userName]]).first
    if (@existingUser != nil)
      @user = User.new
      @user.userName = params[:userName]
      @user.password = params[:password]
      @user.email = params[:email]
      if (@user.save)
        @result = "Success"
      end
    end
  end

end
