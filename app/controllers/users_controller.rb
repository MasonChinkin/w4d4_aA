class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(user_params)
    if user
      login!(user)
      redirect_to XXX
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
