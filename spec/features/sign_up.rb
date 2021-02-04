require 'rails_helper'

RSpec.feature 'SignUps', type: :feature do
  scenario 'users can create an account' do
    visit new_user_path
    fill_in 'user[name]', with: 'bello'
    click_button 'Create user'
    expect(page).to have_content('All Users')
    visit users_path
    expect(page).to have_content('bello')
  end
end
