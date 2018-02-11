class ColorSchemesController < ApplicationController
  before_action :authorize
  before_action :find_color_scheme, only: [:edit, :update, :destroy]
  before_action :find_user_id, only: [:new, :edit]

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @color_schemes = @user.color_schemes
      respond_to do |format|
        format.html { render :index }
        format.json { render json: ColorScheme.user_schemes_json(@user) }
      end
    else
      @color_schemes = ColorScheme.all
    end
  end

  def new
    if @user.id == current_user.id
      @color_scheme = ColorScheme.new
      5.times do
        @color_scheme.color_scheme_colors.new.build_color
      end
    else
      flash[:error] = "You cannot create color schemes for others"
      redirect_to new_user_color_scheme_path(current_user)
    end
  end

  def create
    @color_scheme = current_user.color_schemes.new(color_scheme_params)
    if @color_scheme.save
      flash[:success] = "New color scheme created!"
      respond_to do |format|
        format.html { redirect_to user_color_schemes_path }
        format.json { render json: ColorScheme.user_schemes_json(current_user) }
      end
    else
      flash[:error] = @color_scheme.errors.full_messages.to_sentence
      redirect_to new_user_color_scheme_path
    end
  end

  def edit
    if current_user != @user
      flash[:error] = "Not your color scheme"
      redirect_to color_schemes_path
    end
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

  def random
    color_scheme_ids = ColorScheme.ids
    random_id = color_scheme_ids.sample
    @random_scheme =  ColorScheme.find(random_id)
    partial = render_to_string partial: 'color_schemes/random', locals: { random_scheme: @random_scheme }
    respond_to do |format|
      format.html { render :random }
      format.json { render json: {random_partial: partial} }
    end
    # @random_scheme = ColorScheme.offset(rand(ColorScheme.count)).first
  end

  private

  def color_scheme_params
    params.require(:color_scheme).permit(:name, color_scheme_colors_attributes: [:id, :color_note, color_attributes: [:id, :hex_code]])
  end

end
