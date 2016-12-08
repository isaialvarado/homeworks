class UsersController < ApplicationController
  before_action :redirect_user

  def new
    render :new
  end

  def create
    user = User.new(user_params)

    if user.save
      login_user!(user)
      send_welcome_mail(user)
      redirect_to cats_url
    else
      flash.now[:messages] = user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end

  def redirect_user
    redirect_to cats_url if current_user
  end

  def send_welcome_mail(user)
    msg = UserMailer.welcome_email(user)
    msg.deliver
  end
end
