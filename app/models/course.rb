class Course < ApplicationRecord
  belongs_to :author
  belongs_to :language
  has_many :reviews 
  has_many :users, through: :reviews
end
