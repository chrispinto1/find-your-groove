class Band < ApplicationRecord
  has_many :band_subgenres, dependent: :destroy
  has_many :subgenres, through: :band_subgenres, dependent: :destroy
  has_many :songs
  has_many :likes
  has_many :users, through: :likes
end
