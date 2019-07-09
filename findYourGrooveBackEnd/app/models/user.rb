class User < ApplicationRecord
  has_many :likes
  has_many :bands, through: :likes
end
