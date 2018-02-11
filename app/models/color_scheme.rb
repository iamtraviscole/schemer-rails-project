class ColorScheme < ApplicationRecord
  belongs_to :user
  has_many :favorite_color_schemes, dependent: :destroy
  has_many :favorited_by, through: :favorite_color_schemes, source: :user
  has_many :color_scheme_colors, dependent: :destroy
  has_many :colors, through: :color_scheme_colors
  validates :name, presence: :true
  accepts_nested_attributes_for :color_scheme_colors

  def self.user_schemes_json(user)
    user_color_schemes_json = {
      id: user.id,
      color_schemes: [],
      }
    user.color_schemes.each_with_index do |cs, i|
      user_color_schemes_json[:color_schemes] <<
        {
          id: "#{cs.id}",
          name: "#{cs.name}",
          user_id: "#{cs.user_id}",
          favorite: user.favorites.include?(cs),
          colors: []
        }
      cs.colors.each do |c|
        user_color_schemes_json[:color_schemes][i][:colors] <<
        {
          id: "#{c.id}",
          hex_code: "#{c.hex_code}",
          color_note: "#{c.color_scheme_colors.first.color_note}"
        }
      end
    end
    user_color_schemes_json
  end

end
