class FavoritesController < ApplicationController

  def index
  end

  def show
  end

  def update
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @color_scheme
      redirect_back, notice: 'You favorited #{@color_scheme.name}'
    elsif type == "unfavorite"
      current_user.favorites.delete(@color_scheme)
      redirect_back, notice: 'Unfavorited #{@color_scheme.name}'
    else
      redirect_back, notice: 'Nothing happened.'
    end
  end

end
