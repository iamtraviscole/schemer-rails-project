class ColorScheme < ApplicationRecord
  belongs_to :user
  has_many :favorite_color_schemes, dependent: :destroy
  has_many :favorited_by, through: :favorite_color_schemes, source: :user
  has_many :color_scheme_colors, dependent: :destroy
  has_many :colors, through: :color_scheme_colors
  validates :name, presence: :true
  accepts_nested_attributes_for :color_scheme_colors

  # def color_scheme_colors_attributes=(color_scheme_colors_attributes)
  #   raise color_scheme_colors_attributes.inspect
  #   color_scheme_colors_attributes.each do |i, csc_attributes|
  #
  #   end
  # end

end
