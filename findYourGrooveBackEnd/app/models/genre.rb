class Genre < ApplicationRecord
  has_many :subgenres
  has_many :bands
end
