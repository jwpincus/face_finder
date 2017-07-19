require 'rails_helper'
describe 'A user can register' do
  scenario 'user goes to /signup and can register a new account' do
    visit '/signup'
    fill_in("user_first_name", with: "Test")
    fill_in("user_last_name", with: "User")
    fill_in("user_email", with: "test@test.com")
    fill_in("user_password", with: "password")
    fill_in("user_password_confirmation", with: "password")
    click_on('Sign up!')
    user = User.first
    expect(user.first_name). to eq('Test')
    expect(user.last_name). to eq('User')
  end
end
