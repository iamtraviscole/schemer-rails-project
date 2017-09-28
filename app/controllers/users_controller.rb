class UsersController < ApplicationController
  before_action :authorize, only: :home

  def new
    if current_user
      redirect_to root_path
      flash[:error] = "Please log out first"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:loginerror] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def home
    @favorite_color_schemes = current_user.favorites
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
