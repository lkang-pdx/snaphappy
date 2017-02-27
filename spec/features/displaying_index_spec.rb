require 'rails_helper'

feature 'Can see a list of posts on the index' do
  background do
    user = create :user
    post_one = create(:post, caption: "This is post one", user_id: user.id)
    post_two = create(:post, caption: "This is the second post", user_id: user.id)

    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  scenario 'the index lists all posts' do
    expect(page).to have_content("This is post one")
    expect(page).to have_content("This is the second post")
    expect(page).to have_css("img[src*='shot']")
  end
end
