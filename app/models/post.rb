class Post < ActiveRecord::Base
  attr_accessible :author, :body, :featured, :published_at, :title
  validates :author, presence: true
end
