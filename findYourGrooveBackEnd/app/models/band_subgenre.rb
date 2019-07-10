class BandSubgenre < ApplicationRecord
  belongs_to :band
  belongs_to :subgenre
end
