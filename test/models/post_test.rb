require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: 'Alice')
    @post = Post.create(title: 'Post 1', text: 'Post body', author: @user)
    @comment1 = Comment.create(author: @user, post: @post, text: 'Comment body')
    @comment2 = Comment.create(author: @user, post: @post, text: 'Comment body')
    @like1 = Like.create(author: @user, post: @post)
    @like2 = Like.create(author: @user, post: @post)
  end

  test 'should validate presence of title' do
    @post.title = nil
    assert_not @post.valid?
  end

  test 'should validate maximum length of title' do
    @post.title = 'a' * 251
    assert_not @post.valid?
  end

  test 'should validate numericality of comments_counter' do
    @post.comments_counter = 'invalid'
    assert_not @post.valid?
  end

  test 'should validate numericality of likes_counter' do
    @post.likes_counter = 'invalid'
    assert_not @post.valid?
  end

  test 'should belong to an author' do
    assert_instance_of User, @post.author
  end

  test 'should have many comments' do
    assert_instance_of Comment, @post.comments.build(author: @user, text: 'Comment body')
  end

  test 'should have many likes' do
    assert_instance_of Like, @post.likes.build(author: @user)
  end

  test 'should return the number of comments' do
    assert_equal 2, @post.comments_counter
  end

  test 'should return the number of likes' do
    assert_equal 2, @post.likes_counter
  end

  test 'should add a comment to the post' do
    @post.add_comment(@comment1)
    assert_includes @post.comments, @comment1
    assert_equal 2, @post.comments_counter
  end

  test 'should return the most recent comments up to the given count' do
    @post.comments << @comment1
    @post.comments << @comment2
    assert_equal [@comment2], @post.get_recent_comments(1)
    assert_equal [@comment2, @comment1], @post.get_recent_comments(2)
  end

  test 'should update the posts counter of the associated author when a post is saved' do
    assert_difference -> { @user.reload.posts_counter }, 0 do
      @post.save
    end
  end
end
