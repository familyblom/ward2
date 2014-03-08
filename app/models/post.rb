class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :tags, as: :taggable

  scope :featured, -> { where(featured: true) }
  scope :ordered, -> {order('published_at DESC')}
  # default_scope -> { where("published_at <= ?", Time.now ).order("published_at DESC")}
  attr_accessible :author, :title, :body, :featured, :published_at

  validates :author, :body, presence: true
  validates :title,
              presence: {message: "You gotta have a title man!"},
              uniqueness: true,
              length: { in: 6..65 }

  validate :published_at_is_in_the_future, on: :create

  private

  def published_at_is_in_the_future
    errors.add(:published_at, "time must be in the future") unless self.published_at >= Time.now
  end

end
