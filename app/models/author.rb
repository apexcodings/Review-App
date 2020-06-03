class Author < ApplicationRecord
  has_many :courses
  has_many :languages
  validates :name, presence: true, :uniqueness => {message: "The Author/Publisher you entered has already been added to the site, please select it from the dropdown menu!"}
end
