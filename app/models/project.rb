class Project < ActiveRecord::Base
  has_many :tags, as: :taggable
  accepts_nested_attributes_for :tags, reject_if: :all_blank, allow_destroy: true
  attr_accessible :completion_date, :description, :name, :url, :tags_attributes
end
