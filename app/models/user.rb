class User < ActiveRecord::Base
  has_secure_password
  has_many :tags, as: :taggable
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :profile_picture

  has_attached_file :profile_picture,
    styles: { large: "600x600>",
              medium: "300x300>",
              small: "100x100>",
              tiny: "25x25>"},
    default_url: "/assets/:attachment/:style.png"
  validates :email, :first_name, :last_name, presence: true
  validates :password_confirmation, :password, presence: true, on: :create

  after_create :send_welcome_email

  def street_name
    first_name[0].upcase + '. ' + Faker::DizzleIpsum.word
  end
  private


  def send_welcome_email
    UserMailer.welcome(self).deliver
  end

end
