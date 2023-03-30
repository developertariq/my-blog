require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: 'Alice')
    @post = Post.create(title: 'Post 1', text: 'Post body', author: @user)
  end

  test 'should belong to author' do
    comment = Comment.new(author: @user, post: @post, text: 'Comment body')
    assert_instance_of User, comment.author
  end

  test 'should belong to post' do
    comment = Comment.new(author: @user, post: @post, text: 'Comment body')
    assert_instance_of Post, comment.post
  end

  test 'should update post comments counter' do
    @comment = Comment.create(author: @user, post: @post, text: 'Comment body')
    @post.reload
    assert_equal 1, @post.comments_counter
  end

  test 'should update post comments counter when a comment is saved' do
    comment = Comment.new(author: @user, post: @post, text: 'Comment body')
    assert_difference('@post.reload.comments_counter', 1) do
      comment.save
    end
  end
end
