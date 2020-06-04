class Review < ApplicationRecord
  belongs_to :user
  belongs_to :course
  validates :description, :presence => {message: "for review cannot be left blank"}, length: {minimum: 50, message: "must be at least 50 characters long"}  
  validates :rating, presence: true,  inclusion: { in: 1..5, message: "must be between 1 and 5"}
end
