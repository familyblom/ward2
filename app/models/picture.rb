class Picture < ActiveRecord::Base
  belongs_to :pictureable, polymorphic: true
  attr_accessible :title, :image

  has_attached_file :image,
      styles: { large: "600x600>",
                medium: "300x300>",
                small: "100x100>",
                tiny: "25x25>"}


end
