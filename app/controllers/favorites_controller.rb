class FavoritesController < ApplicationController

  def index
    @favorites = current_user.favorites
  end

  def show
  end

  def update
    @color_scheme = ColorScheme.find(params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @color_scheme
      redirect_back(fallback_location: user_favorites_path)
    elsif type == "unfavorite"
      current_user.favorites.delete(@color_scheme)
      redirect_back(fallback_location: user_favorites_path)
    else
      redirect_back(fallback_location: user_favorites_path)
    end
  end

end
