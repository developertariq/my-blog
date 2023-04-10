require 'rails_helper'
Rspec.describe 'User Index Page', type: :feature do
  before :each do
    @user = User.create(
      name: 'Tariq Islam'
      photo: 'https://images.pexels.com/photos/4050426/pexels-photo-4050426.jpeg'
      bio: 'chill with laptop'
      posts_counter: 2
    )
    visit users_path
  end

  scenario 'shows the profile picture for each user' do
    visit '/users'
    expect(page).to have_css('img')
  end

  scenario 'shows the user\'s username' do
    visit '/users'
    expect(page).to have_content(@user.name)
  end

  scenario 'shows number of posts user has written' do
    visit '/users'
    expect(page).to have_content(@user.posts_counter)
  end

  scenario 'shows user\'s bio' do
    visit '/users'
    expect(page).to have_content(@user.bio)
  end

  scenario 'shows user\'s first three posts' do
    visit '/users'
    expect(page).to have_content(@user.posts_counter.order(created_at: :desc).limit(3))
  end

  scenario 'shows button that lets user view all of a user\'s posts.' do
    visit '/users'
    click_button('See all post')
    expect(page).to have_button('See all post')
  end

  scenario 'it redirects me to that post\'s show page.' do
    visit '/users'
    click_button('See all post')
    expect(page).to have_content('This is my first post')
  end

  scenario 'it redirects me to the user\'s post\'s index page.' do
    visit '/users'
    click_button('See post')
    expect(page).to have_button('User Post')
  end
end