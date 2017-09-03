class ColorScheme < ApplicationRecord
  belongs_to :user
  has_many :favorite_color_schemes
  has_many :favorited_by, through: :favorite_color_schemes, source: :user
  has_many :color_scheme_colors
  has_many :colors, through: :color_scheme_colors
end
