class UsersController < ApplicationController
  before_action :authorize, only: :dashboard

  def new
    if current_user
      redirect_to root_path
      # please log out first
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def dashboard
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
