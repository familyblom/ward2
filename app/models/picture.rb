class Picture < ActiveRecord::Base
  belongs_to :pictureable, polymorphic: true
  attr_accessible :title, :image

  has_attached_file :image


end
