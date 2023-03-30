require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: 'Alice')
    @post = Post.create(title: 'Post 1', text: 'Post body', author: @user)
  end

  test 'should belong to author' do
    like = Like.new(author: @user, post: @post)
    assert_instance_of User, like.author
  end

  test 'should belong to post' do
    like = Like.new(author: @user, post: @post)
    assert_instance_of Post, like.post
  end

  test '#update_post_likes_counter' do
    assert_difference('@post.likes_counter', 1) do
      @like = Like.create(author: @user, post: @post)
    end
  end

  test 'should update post likes counter when a like is saved' do
    like = Like.new(author: @user, post: @post)
    assert_difference('@post.reload.likes_counter', 1) do
      like.save
    end
  end
end
