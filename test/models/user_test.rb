require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: 'Alice')
    @post1 = Post.create(title: 'Post 1', text: 'Post body', author: @user)
    @post2 = Post.create(title: 'Post 2', text: 'Post body', author: @user)
    @post3 = Post.create(title: 'Post 3', text: 'Post body', author: @user)
    @comment1 = Comment.create(author: @user, post: @post1, text: 'Comment body')
    @comment2 = Comment.create(author: @user, post: @post2, text: 'Comment body')
    @like1 = Like.create(author: @user, post: @post1)
    @like2 = Like.create(author: @user, post: @post2)
  end

  test 'should validate presence of name' do
    @user.name = nil
    assert_not @user.valid?
  end

  test 'should validate numericality of posts_counter' do
    @user.posts_counter = 'not a number'
    assert_not @user.valid?
    @user.posts_counter = -1
    assert_not @user.valid?
    @user.posts_counter = 0
    assert @user.valid?
    @user.posts_counter = 1
    assert @user.valid?
  end

  test 'should have many posts, comments and likes' do
    assert @user.posts, [@post1, @post2, @post3]
    assert @user.comments, [@comment1, @comment2]
    assert @user.likes, [@like1, @like2]
  end

  test '#posts_counter should return the number of posts by the user' do
    assert_equal 3, @user.posts_counter
  end

  test '#get_recent_posts should return the most recent posts up to the given count' do
    assert_equal [@post3], @user.get_recent_posts(1)
    assert_equal [@post3, @post2], @user.get_recent_posts(2)
  end
end
