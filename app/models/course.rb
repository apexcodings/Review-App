class Course < ApplicationRecord
  belongs_to :author
  belongs_to :language
  has_many :reviews 
  has_many :users, through: :reviews
  validates :title, presence: true, :uniqueness => {message: "The Course you entered has already been added to the site, please search for the course and add a review to the designated course page"}
  validates :description, :presence => {message: "for Course can't be blank"}
  validates_presence_of :author_id, :language_id

  scope :most_reviews, -> {joins(:reviews).group(:course_id).order("COUNT(reviews.course_id) DESC").limit(10)}

  def reviews_attributes=(hash)
    r = Review.new(hash["0"])
    r.course = self
    r.valid?
    unless r.errors.keys.include?(:description) || r.errors.keys.include?(:rating)
      r.course = self
      self.reviews << r
    end
  end

  def language_name=(name)
    self.language = Language.find_or_create_by(name: name)
  end

  def author_name=(name)
    self.author = Author.find_or_create_by(name: name)
  end

  def language_name 
    self.language ? self.language.name : nil
  end

  def author_name 
    self.author ? self.author.name : nil
  end

  def self.search(search)
    if search
      self.where('title LIKE ?', "%#{search}%")
    else 
      Course.most_reviews
    end
  end

end
