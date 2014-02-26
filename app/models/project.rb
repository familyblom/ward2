class Project < ActiveRecord::Base
  has_many :tags, as: :taggable
  has_many :pictures, as: :pictureable
  has_many :tools

  accepts_nested_attributes_for :tags, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :tools, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :pictures, reject_if: :all_blank, allow_destroy: true
  attr_accessible :completion_date, :description, :name, :url, :tags_attributes, :tools_attributes, :pictures_attributes
end
