class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :author, :message
  # validates :author, presence: true
end
