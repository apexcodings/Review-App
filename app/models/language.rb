class Language < ApplicationRecord
  has_many :courses
  has_many :authors, through: :courses
  validates :name, presence: true, :uniqueness => {message: "The Language you entered has already been added to the site, please select it from the dropdown menu!"}

  scope :most_courses, -> {joins(:courses).group(:language_id).order("COUNT(courses.language_id) DESC").limit(10)}

  def self.search(search)
    if search
      self.where('name LIKE ?', "%#{search}%")
    else 
      Language.most_courses
    end
  end
end
