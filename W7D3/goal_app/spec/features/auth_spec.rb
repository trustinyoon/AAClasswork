require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    vist new_user_url
    expect(page).to have_content "Signup"
    expect(page).to have_content "Username: "
  end

  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do
      vist new_user_url
      fill_in 'username', with: 'alvin'
      fill_in 'password', with: '123456'
      click_on 'Sign up'
      expect(current_path).to eq(users_url)
      expect(page).to have_content "alvin"
    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login'

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end