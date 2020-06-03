class Language < ApplicationRecord
  has_many :courses
  has_many :authors, through: :courses
  validates :name, presence: true, :uniqueness => {message: "The Language you entered has already been added to the site, please select it from the dropdown menu!"}
end
