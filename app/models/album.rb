class Album < ApplicationRecord
  has_and_belongs_to_many :songs, join_table: 'associations'
  has_and_belongs_to_many :artists, join_table: 'associations'
  
  validates :title, presence: true
  validates :rating, presence: true, acceptance: { accept: [-1, 1], message: 'must be 1 or -1' }
end
