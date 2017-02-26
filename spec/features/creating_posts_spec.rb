require 'rails_helper.rb'

feature 'Index displays a list of posts' do
  scenario 'the index displays correct created post information' do
    post_one = create(:post, caption: "This is post one")
    post_two = create(:post, caption: "This is the second post")

    visit '/'
    expect(page).to have_content("This is post one")
    expect(page).to have_content("This is the second post")
    expect(page).to have_css("img[src*='shot']")
  end
end

feature 'Can view individual posts' do
  scenario 'Can click and view a single post' do
    post = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    expect(page.current_path).to eq(post_path(post))
  end
end 

feature 'Creating posts' do
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
