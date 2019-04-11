class Album < ApplicationRecord
  has_many :associations  
  has_many :songs, through: :associations
  has_many :artists, through: :associations
  
 
  validates :name, presence: true, length: {minimum: 1, maximum: 50}
end
