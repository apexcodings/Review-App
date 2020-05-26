class User < ApplicationRecord
  has_many :reviews
  has_many :courses, through: :reviews
  has_many :authors, through: :courses
  has_many :languages, through: :courses

  has_secure_password

end
