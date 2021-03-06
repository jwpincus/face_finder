require 'rails_helper'
feature 'A user visiting the home page' do
  scenario 'can click on log in to be taken to log in screen' do
    visit '/'
    expect(page).to have_content('Login')
    expect(page).to have_content('Sign Up')
  end
end
