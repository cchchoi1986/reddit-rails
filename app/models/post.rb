class Post < ActiveRecord::Base
  
  belongs_to :user

  has_many :comments

  URL_REGEX = /https?:\/\/[\S]+/

  validates :title, :length => {maximum: 140 }, :presence => true
  validates :url, :length => {maximum: 2083}, :allow_blank => true, :format => { with: URL_REGEX}

  validate :spam_free

  validate :onlytwenty

  private
  def spam_free
    last_post = Post.order(:created_at).last
    # latest_time = last_post.created_at

    if Post.any? and last_post.created_at > 1.minute.ago
      self.errors.add(:base, "Cannot post within 1 minute")
    end
  end

  def onlytwenty
    post_count = Post.count
    if post_count > 20
      self.errors.add(:base, "Cannot post more than 20 entries")
    end
  end
end
