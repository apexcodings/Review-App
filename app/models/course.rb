class Course < ApplicationRecord
  belongs_to :author
  belongs_to :language
  has_many :reviews 
  has_many :users, through: :reviews
  validates :title, presence: true, :uniqueness => {message: "The Course you entered has already been added to the site, please search for the course and add a review to the designated course page"}
  validates :description, presence: true
  validates_presence_of :author_id, :language_id
  validate :review_cannot_be_blank



  accepts_nested_attributes_for :reviews


  def review_cannot_be_blank
    if self.reviews != [] && ((self.reviews[0][:rating] == "" || self.reviews[0][:rating] == "") || (self.reviews[0][:description] == "" || self.reviews[0][:description] == ""))
      self.errors.add(:blank_review_error, "You must fill out an entire review")
    end
  end


  def language_name=(name)
    self.language = Language.find_or_create_by(name: name)
    self.save
  end

  def author_name=(name)
    self.author = Author.find_or_create_by(name: name)
    self.save
  end

  def language_name 
    self.language ? self.language.name : nil
  end

  def author_name 
    self.author ? self.author.name : nil
  end


end
