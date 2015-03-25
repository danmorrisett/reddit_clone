def login(user)
  visit root_path
  click_link 'Sign In'
  fill_in "Email", with: 'Bill@Clinton.com'
  fill_in "Password", with: '123'
  click_on 'Sign In'
end
