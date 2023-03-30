class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def comments_counter
    comments.count
  end

  def likes_counter
    likes.count
  end

  after_save :update_author_posts_counter

  def add_comment(comment)
    comments << comment
  end

  def get_recent_comments(count = 5)
    comments.order(created_at: :desc).limit(count)
  end

  private

  def update_author_posts_counter
    author.update(posts_counter: author.posts.count)
  end
end
