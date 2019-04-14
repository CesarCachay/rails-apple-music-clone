class Artist < ApplicationRecord
  has_and_belongs_to_many :songs, join_table: 'associations', dependent: :delete_all
  has_and_belongs_to_many :albums, join_table: 'associations', dependent: :delete_all
<<<<<<< HEAD
=======
  
>>>>>>> aca8f11e079e321218d4fa723f09d6a0b6dd36cf
  validates :name, presence: true
  validates :age, presence: false

  def self.search(search_name)
    self.where("name LIKE ?", "%#{search_name}%")
  end

end
