class ColorSchemeColor < ApplicationRecord
  belongs_to :color_scheme
  belongs_to :color

  def color_attributes=(color_attributes)
    color_attributes.each do |i, hex_code|
        self.color = Color.find_or_initialize_by(hex_code: hex_code)
    end
  end

end
