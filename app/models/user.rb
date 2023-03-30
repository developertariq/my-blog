class User < ApplicationRecord
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def posts_counter
    posts.count
  end

  def get_recent_posts(count = 3)
    posts.where(author: self).order(created_at: :desc).limit(count)
  end
end
