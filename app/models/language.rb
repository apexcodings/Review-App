class Language < ApplicationRecord
  has_many :courses
  has_many :authors, through: :courses
end
