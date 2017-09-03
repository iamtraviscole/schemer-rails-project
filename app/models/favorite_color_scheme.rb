class FavoriteColorScheme < ApplicationRecord
  belongs_to :user
  belongs_to :color_scheme
end
