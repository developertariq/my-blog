class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_likes
    self.likes += 1
    save
  end
end
