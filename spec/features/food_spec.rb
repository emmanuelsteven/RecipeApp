require 'rails_helper'

RSpec.feature 'Foods', type: :feature do
  let(:user) { User.create(name: 'Joy', email: 'joy@example.com', password: 'password', confirmed_at: Time.now) }

  before do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  scenario 'User navigates to the new food item form' do
    visit new_food_path

    click_link 'AddFood'

    expect(page).to have_content('Add Food')
    expect(page).to have_field('Name')
    expect(page).to have_field('Price')
    expect(page).to have_field('Quantity')
  end

  scenario 'User creates a new food item' do
    visit new_food_path
    fill_in 'Name', with: 'ogba'
    fill_in 'Price', with: '454.0'
    fill_in 'Quantity', with: '1.0'
    click_button 'Add Food'

    expect(page).to have_content('ogba')
    expect(page).to have_content('454.0')
  end
end
