class Tag < ActiveRecord::Base
  belongs_to :taggable
  attr_accessible :name
end
