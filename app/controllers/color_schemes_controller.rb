class ColorSchemesController < ApplicationController

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
      redirect_to user_color_schemes_path
    else
      redirect_to new_user_color_scheme_path
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @color_scheme = ColorScheme.find(params[:id])
  end

  def update
    @color_scheme = ColorScheme.find(params[:id])
    if @color_scheme.update(color_scheme_params)
      redirect_to user_color_schemes_path
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def color_scheme_params
    params.require(:color_scheme).permit(:name, colors_attributes: [:id, :hex_code])
  end

end
