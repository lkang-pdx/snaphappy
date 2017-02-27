require 'rails_helper.rb'

feature 'Creating posts' do
  background do
    user = create :user
    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/shot.png")
    fill_in 'Caption', with: 'nom nom nom #screenshot'
    click_button 'Create Post'
    expect(page).to have_content('#screenshot')
    expect(page).to have_css("img[src*='shot.png']")
  end

  it 'needs an image to create a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: "No picture because YOLO"
    click_button 'Create Post'
    expect(page).to have_content('Halt, you fiend! You need an image to post here!')
  end
end
