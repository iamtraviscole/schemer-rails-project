class ColorScheme < ApplicationRecord
  belongs_to :user
  has_many :favorite_color_schemes, dependent: :destroy
  has_many :favorited_by, through: :favorite_color_schemes, source: :user
  has_many :color_scheme_colors, dependent: :destroy
  has_many :colors, through: :color_scheme_colors
  validates :name, presence: :true
  accepts_nested_attributes_for :color_scheme_colors

  def self.schemes_json(color_schemes)
    color_schemes_json = []
    color_schemes.each_with_index do |cs, i|
      color_schemes_json <<
        {
          id: "#{cs.id}",
          name: "#{cs.name}",
          user_id: "#{cs.user_id}",
          colors: []
        }
      cs.colors.each do |c|
        color_schemes_json[i][:colors] <<
        {
          id: "#{c.id}",
          hex_code: "#{c.hex_code}",
          color_note: "#{c.color_scheme_colors.first.color_note}"
        }
      end
    end
    color_schemes_json
  end

end
