class FavoritesController < ApplicationController
  before_action :authorize
  before_action :find_color_scheme, only: [:update]
  before_action :find_user_id, only: [:index]

  def index
    @favorites = @user.favorites
  end

  def show
  end

  def update
    @color_scheme = ColorScheme.find(params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @color_scheme
      flash[:success] = "Favorited!"
      redirect_back(fallback_location: user_favorites_path)
    elsif type == "unfavorite"
      current_user.favorites.delete(@color_scheme)
      flash[:success] = "Unfavorited!"
      redirect_back(fallback_location: user_favorites_path)
    else
      flash[:error] = "Something went wrong"
      redirect_back(fallback_location: user_favorites_path)
    end
  end

end
