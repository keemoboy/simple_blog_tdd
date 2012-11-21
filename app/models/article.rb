class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  validates :body,:title, :presence => true
  attr_accessible :body, :title
end
