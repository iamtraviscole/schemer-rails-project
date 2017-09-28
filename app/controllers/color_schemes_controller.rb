class ColorSchemesController < ApplicationController
  before_action :authorize
  before_action :find_color_scheme, only: [:edit, :update, :destroy]

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @color_schemes = @user.color_schemes.all
    else
      @color_schemes = ColorScheme.all
    end
  end

  def new
    @user = User.find(params[:user_id])
    @color_scheme = ColorScheme.new
    5.times do
      @color_scheme.colors.new
    end
  end

  def create
    @color_scheme = current_user.color_schemes.new(color_scheme_params)
    if @color_scheme.save
      flash[:success] = "New color scheme created!"
      redirect_to user_color_schemes_path
    else
      flash[:error] = "Something went wrong"
      redirect_to new_user_color_scheme_path
    end
  end

  def edit
    @user = User.find(params[:user_id])
  end

  def update
    if @color_scheme.update(color_scheme_params)
      flash[:success] = "Color scheme updated!"
      redirect_to user_color_schemes_path
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    if current_user.color_schemes.include?(@color_scheme)
      @color_scheme.destroy
      flash[:success] = "Color scheme deleted!"
      redirect_to user_color_schemes_path
    else
      flash[:error] = "Not your color scheme"
      redirect_to user_color_schemes_path
    end
  end

  def popular
    @popular_color_schemes = FavoriteColorScheme.most_popular
  end

  private

  def color_scheme_params
    params.require(:color_scheme).permit(:name, colors_attributes: [:id, :hex_code])
  end

  def find_color_scheme
    @color_scheme = ColorScheme.find(params[:id])
  end

end
