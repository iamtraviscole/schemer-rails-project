class ColorScheme < ApplicationRecord
  belongs_to :user
  has_many :favorite_color_schemes
  has_many :favorited_by, through: :favorite_color_schemes, source: :user
  has_many :color_scheme_colors
  has_many :colors, through: :color_scheme_colors

  def colors_attributes=(colors_attributes)
    self.colors.clear
    colors_attributes.each do |i, color_attributes|
      self.colors << Color.find_or_initialize_by(hex_code: color_attributes[:hex_code])
    end
  end

end
