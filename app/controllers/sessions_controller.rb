class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user
      login!(user)
      redirect_to user_url(user)
    else
      # flash.now[:errors] = @user.errors.full_messages
      # redirect_to user_url(user)
      render plain: "user not found"
    end
  end

  def destroy
    logout!(user)
  end
end
