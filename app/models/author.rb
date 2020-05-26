class Author < ApplicationRecord
  has_many :courses
  has_many :languages
end
