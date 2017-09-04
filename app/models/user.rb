class User < ApplicationRecord
  has_many :color_schemes
  has_many :favorite_color_schemes
  has_many :favorites, through: :favorite_color_schemes, source: :color_scheme

  has_secure_password

  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, with: /@/
end
