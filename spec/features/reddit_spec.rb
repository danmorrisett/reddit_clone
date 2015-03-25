require 'rails_helper'


describe "Reddit_Clone" do

  before :each do
    post = create_post
  end

  scenario "Anyone visits Reddit_Clone and sees a list of all posts" do

    visit root_path

    expect(page).to have_content "Welcome to Reddit_Clone"
    expect(page).to have_content "Sign Up"
    expect(page).to have_content "Sign In"
    expect(page).to have_content "Todays top posts"

  end

  scenario "Anyone can click on a post to view its comments" do

    visit root_path
save_and_open_page
    click_link 'Test Title'
    expect(current_path).to eq post_path(post)
    expect(page).to have_content :post_title
    expect(page).to have_content 'Words go here'

  end

  feature 'Sign up as a new user' do
    scenario 'can visit root path and sign up as a new user' do

      user.destroy!

      visit root_path

      click_link 'Sign Up'

      expect(current_path).to eq '/sign-up'
      expect(page).to have_content 'Sign up for gCamp!'
      fill_in :user_first_name, with: 'Bill'
      fill_in :user_last_name, with: 'Clinton'
      fill_in :user_username, with: "RedditBill"
      fill_in :user_email, with: 'Bill@Clinton.com'
      fill_in :user_password, with: '123'
      fill_in :user_password_confirmation, with: '123'

      click_button 'Sign Up'

      expect(current_path).to eq root_path
      expect(page).to have_content 'You have successfully signed up'
    end
  end



end












# Anyone can visit the root page and see a list of all the posts
# Anyone can click on a post to view its comments
# Only a logged in user can submit a new post
# Only a logged in user can comment on a post
# Only the owner/creator of a post can edit that post
# Only the owner/creator of a post can delete that post
# Only the owner/creator of a comment can edit that comment
# Only the owner/creator of a comment can delete that comment
