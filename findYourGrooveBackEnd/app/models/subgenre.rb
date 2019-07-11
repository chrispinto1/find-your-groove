class Subgenre < ApplicationRecord
  belongs_to :genre, required: false
  has_many :band_subgenres
  has_many :bands, through: :band_subgenres
end
