class Subgenre < ApplicationRecord
  belongs_to :genre
  has_many :bands
end
