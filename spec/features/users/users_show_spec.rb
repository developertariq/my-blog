require 'rails_helper'
RSpec.describe 'User Index Page', type: :feature do
  before :each do
    @user = User.create(
      name: 'Ellon',
      photo: 'https://picsum.photos/300/200',
      bio: 'Software Engineer from Nigeria',
      posts_counter: 4
    )
    @post1 = Post.create(author: @user, title: 'Hello', text: 'Hello World!')
    @post2= Post.create(author: @user, title: 'Howdy', text: 'This is test post.')
    @post3= Post.create(author: @user, title: 'Greetings', text: 'Good evening from Nigeria')
    visit user_path(@user)
  end

  scenario 'shows the profile picture for each user' do
    user_path(@user)
    expect(page).to have_css('img')
  end

  scenario 'shows the user\'s username' do
    user_path(@user)
    expect(page).to have_content(@user.name)
  end

  scenario 'shows number of posts user has written' do
    user_path(@user)
    expect(page).to have_content(@user.posts_counter)
  end

  scenario 'shows user\'s bio' do
    user_path(@user)
    expect(page).to have_content(@user.bio)
  end

  scenario 'shows user\'s first three posts' do
    visit user_path(@user)
    posts = @user.recent_posts.limit(3)
      posts.each do |post|
        expect(page).to have_content(post.title)
        expect(page).to have_content(post.text)
      end
  end

  scenario 'shows button that lets user view all of a user\'s posts.' do
    user_path(@user)
    expect(page).to have_link("See all posts", href: user_posts_path(@user))
  end

  scenario 'it redirects me to that post\'s show page.' do
    visit user_path(@user)
    click_link('Hello')
    expect(page).to have_current_path(user_post_path(@user, @post1))
  end

  scenario 'it redirects me to the user\'s post\'s index page.' do
    visit user_path(@user)
    click_link("See all posts")
    expect(page).to have_current_path(user_posts_path(@user))
  end
end