require 'spec_helper'

describe 'logged in or newly created user can enroll' do
  scenario 'already registered user redirected to enroll photo if no enrollments' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    expect(page).to have_current_path('/enroll')

  end
  scenario 'new user is directed to enroll on succesful registration' do
    visit '/signup'
    fill_in("user_first_name", with: "Test")
    fill_in("user_last_name", with: "User")
    fill_in("user_email", with: "test@test.com")
    fill_in("user_password", with: "password")
    fill_in("user_password_confirmation", with: "password")
    click_on('Sign up!')
    expect(page).to have_current_path('/enroll')
  end
end
