require 'rails_helper'


describe "Reddit_Clone" do

  before :each do
    user = create_user
    @post = create_post(user)
    login(user)
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
    click_link 'Test Title'
    expect(current_path).to eq post_path(@post)
    expect(page).to have_content :post_title
    expect(page).to have_content 'Words go here'

  end

  feature 'Sign up as a new user' do
    scenario 'can visit root path and sign up as a new user' do

      user = User.destroy_all

      visit root_path

      click_link 'Sign Up'

      expect(current_path).to eq signup_path
      expect(page).to have_content 'Sign up for Reddit_Clone'
      fill_in "First name", with: 'Bill'
      fill_in "Last name", with: 'Clinton'
      fill_in "Username", with: "RedditBill"
      fill_in "Email", with: 'Bill@Clinton.com'
      fill_in "Password", with: '123'
      fill_in "Password Confirmation", with: '123'

      click_button 'Sign Up'

      expect(current_path).to eq root_path
      expect(page).to have_content 'You have successfully signed up'

    end

    scenario 'only a logged in user can submit a new post' do

      click_link 'New Post'

      expect(current_path).to eq new_post_path
      expect(page).to have_content 'Fill in the Post Clone!'
      fill_in "Title", with: "Mr. President"
      fill_in "Content", with: "I am innocent, but I like cigars!"

      click_button "Submit New Post"

      expect(page).to have_content 'There\'s still time to change the road your on'
      expect(page).to have_content 'Mr. President'
      expect(page).to have_content 'I am innocent, but I like cigars!'

      expect(page).to have_link "Edit"
      expect(page).to have_link "Reddit-Clone Home"

    end

    scenario 'only a logged in user can comment on a post' do




    end

  end



end













# Only the owner/creator of a post can edit that post
# Only the owner/creator of a post can delete that post
# Only the owner/creator of a comment can edit that comment
# Only the owner/creator of a comment can delete that comment
