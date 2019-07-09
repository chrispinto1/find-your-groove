class Band < ApplicationRecord
  belongs_to :genre
  has_many :subgenres, through: :genres
  has_many :likes
  # has_many :users, through: :likes, required: false
end
