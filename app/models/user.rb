class User < ApplicationRecord
  has_many :reviews
  has_many :courses, through: :reviews
  has_many :authors, through: :courses
  has_many :languages, through: :courses
  validates :name, presence: true, uniqueness: true

  has_secure_password

end
