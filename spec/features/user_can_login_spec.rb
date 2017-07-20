require 'rails_helper'
describe 'registered user can log in' do
  scenario 'using email and password' do
    user = User.create(first_name: "Jack", email: "1@1.com", password: "pass", password_confirmation: 'pass')
    visit '/login'
    fill_in('email', with: user.email)
    fill_in('password', with: 'pass')
    click_on('Submit')
    expect(page).to have_content(' Jack')
  end
  scenario 'Fails with bad password' do
    user = User.create(first_name: "Jack", email: "1@1.com", password: "pass", password_confirmation: 'pass')
    visit '/login'
    fill_in('email', with: user.email)
    fill_in('password', with: 'word')
    click_on('Submit')
    expect(page).to have_content('Something went wrong! Please try again')
  end
end
