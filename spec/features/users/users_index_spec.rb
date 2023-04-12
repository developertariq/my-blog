require 'rails_helper'

RSpec.describe 'User Index Page', type: :feature do
  let!(:user) { User.create(name: 'Ellon', photo: 'https://picsum.photos/300/200', bio: 'Software Engineer from Nigeria') }
  before do
    visit users_path
  end

  it 'shows username' do
    expect(page).to have_content('Ellon')
  end

  it 'should show the profile picture for each user' do
    expect(page).to have_css('img')
  end

  it 'should show the number of posts each user has written' do
    expect(page).to have_content("Number of posts: #{user.posts_counter}")
  end

  it 'should redirect to user show page when clicked' do
    click_link('Ellon')
    expect(page).to have_content('Ellon')
  end
end
