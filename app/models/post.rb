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

  def update_posts_counter
    author.update(posts_count: author.posts_count + 1)
  end

  def update_likes_counter
    likes_count = likes.count
    update(likes_count:)
  end

  def update_comments_counter
    comments_count = comments.count
    update(comments_count:)
  end

  def add_comment(comment)
    comments << comment
    update_comments_counter
  end

  def get_recent_comments(count = 5)
    comments.order(created_at: :desc).limit(count)
  end
end
