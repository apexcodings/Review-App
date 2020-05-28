class Course < ApplicationRecord
  belongs_to :author
  belongs_to :language
  has_many :reviews 
  has_many :users, through: :reviews

  accepts_nested_attributes_for :reviews





  def language_name=(name)
    # can I not do self.language = Language.find_or_create_by(name: name)
    language = Language.new(name: name)
    self.language = language
  end



  author_name=



  private 

  strong_params permit the above two 

end
