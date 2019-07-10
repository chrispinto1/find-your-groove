class Band < ApplicationRecord
  has_many :band_subgenres
  has_many :subgenres, through: :band_subgenres
  has_many :songs
end
