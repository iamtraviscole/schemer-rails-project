class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to root_path
      flash[:error] = "Please log out first"
    end
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:loginerror] = "Invalid Email or Password"
      render :new
    end
  end

  def create_with_github
    user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.email = auth['info']['email']
      u.password = u.password_confirmation = SecureRandom.urlsafe_base64(n=6)
    end
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to login_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
