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

  it 'shows username' do
    visit users_path
    expect(page).to have_content('Tariq Islam')
  end

  it 'should show the profile picture for each user' do
    visit users_path
    expect(page).to have_css('img')
  end

  it 'should show the number of posts each user has written' do
    visit users_path
    expect(page).to have_content('Number of posts: 2')
  end

  it 'should redirect to user show page when clicked' do
    visit users_path
    click_link('Tariq Islam')
    expect(page).to have_content('Tariq Islam')
  end
end