require 'rails_helper'
describe 'registered user can log in' do
  scenario 'using email and password are directed to enroll if no enrollments' do
    user = User.create(first_name: "Jack", email: "1@1.com", password: "pass", password_confirmation: 'pass')
    visit '/login'
    within("form") do
      fill_in('email', with: user.email)
      fill_in('password', with: 'pass')
    end
    click_on('Submit')
    expect(page).to have_content(' Jack')
    expect(page).to have_current_path('/enroll')
  end
  scenario 'using email and password are directed to dashboard if enrolled' do
    user = User.create(first_name: "Jack", email: "1@1.com", password: "pass", password_confirmation: 'pass')
    user.enrollments.create()
    visit '/login'
    within("form") do
      fill_in('email', with: user.email)
      fill_in('password', with: 'pass')
    end
    click_on('Submit')
    expect(page).to have_content(' Jack')
    expect(page).to have_current_path('/dashboard')
  end
  scenario 'Fails with bad password' do
    user = User.create(first_name: "Jack", email: "1@1.com", password: "pass", password_confirmation: 'pass')
    visit '/login'
    within("form") do
      fill_in('email', with: user.email)
      fill_in('password', with: 'word')
    end
    click_on('Submit')
    expect(page).to have_content('Something went wrong! Please try again')
  end
end
