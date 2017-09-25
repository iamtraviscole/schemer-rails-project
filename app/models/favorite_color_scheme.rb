class FavoriteColorScheme < ApplicationRecord
  belongs_to :user
  belongs_to :color_scheme

  def self.most_popular
    fav_schemes = self.group('color_scheme_id').order('color_scheme_id asc').limit(20)
    fav_schemes.map do |fs|
      ColorScheme.find_by(id: fs.color_scheme_id)
    end
  end

end
