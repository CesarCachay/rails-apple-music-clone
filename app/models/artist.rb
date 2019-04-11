class Artist < ApplicationRecord
  has_many :associations  
  has_many :songs, through: :associations
  has_many :albums, through: :associations 

  validates :name, presence: true, length: {minimum: 1, maximum: 50}
end
