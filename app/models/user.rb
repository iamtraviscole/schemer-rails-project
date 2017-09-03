class User < ApplicationRecord
  has_many :color_schemes
  has_many :favorite_color_schemes
  has_many :favorites, through: :favorite_color_schemes, source: :color_scheme
  has_secure_password
end
