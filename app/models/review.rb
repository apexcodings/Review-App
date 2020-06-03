class Review < ApplicationRecord
  belongs_to :user
  belongs_to :course
  validates :description, presence: true
  validates :rating,  inclusion: { in: 1..5}, presence: true
end
