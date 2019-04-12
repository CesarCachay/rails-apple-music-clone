class Artist < ApplicationRecord
<<<<<<< HEAD
  has_and_belongs_to_many :songs, join_table: 'associations'
  has_and_belongs_to_many :albums, join_table: 'associations'

=======
  has_and_belongs_to_many :songs, join_table: 'associations', dependent: :delete_all
  has_and_belongs_to_many :albums, join_table: 'associations', dependent: :delete_all
>>>>>>> master
  validates :name, presence: true, length: {minimum: 1, maximum: 50}
  validates :age, presence: false
end
