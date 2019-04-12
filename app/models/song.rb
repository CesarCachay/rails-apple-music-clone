class Song < ApplicationRecord
  has_and_belongs_to_many :albums, join_table: 'associations'
  has_and_belongs_to_many :artists, join_table: 'associations'

  validates :title, presence: true, length: {minimum: 1, maximum: 50}
  validates :duration, presence: false
  validates :rating, presence: false
  validates :progress, presence: false
end
