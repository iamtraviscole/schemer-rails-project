class Color < ApplicationRecord
  has_many :color_scheme_colors
  has_many :color_schemes, through: :color_scheme_colors
end
