class User < ApplicationRecord
  has_many :posts

  def posts_counter
    posts.count
  end

  def update_posts_count
    self.posts_counter = posts_counter + 1
    save
  end

  def get_recent_posts(count = 3)
    posts.where(author: self).order(created_at: :desc).limit(count)
  end
end
