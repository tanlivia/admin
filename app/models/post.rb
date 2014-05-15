class Post < ActiveRecord::Base
  attr_accessible :body, :title
  
  has_many :comments, dependent: :destroy

  validates_presence_of :body, :title
end
