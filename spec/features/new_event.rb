require 'rails_helper'

RSpec.feature 'CreateEvents', type: :feature do
  before(:each) do
    @user = User.create!(name: 'bello')
  end

  scenario 'users can sign up and create events' do
    visit login_path
    fill_in 'name', with: 'bello'
    click_button 'Login'
    expect(page).to have_content('New Event')
    visit new_event_path
    fill_in 'event[title]', with: 'house party'
    fill_in 'event[description]', with: 'party at my house'
    fill_in 'event[date]', with: '2021-10-02'
    click_button 'Create Event'
    visit events_path
    expect(page).to have_content('house party')
  end
end
