require 'rails_helper'
describe 'An app owner can' do
  before(:each) do
    user = create(:enrolled_user)
    @app_user = User.create(first_name: 'app_user', email: 'app@user.com', password: 'pass', password_confirmation: 'pass')
    @app = create(:app)
    user.apps << @app
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit "/apps/#{@app.id}"
    within('#users') do
      fill_in('User Email', with: @app_user.email)
      click_on('Add User')
    end
  end
  scenario 'add a user to an app by email' do

    expect(page).to have_content(@app_user.first_name)
    expect(page).to have_content("#{@app_user.email} was added")
  end
  scenario 'will be told if the user cannot be found' do
    visit "/apps/#{@app.id}"
    within('#users') do
      fill_in('User Email', with: "not@real.com")
      click_on('Add User')
    end
    expect(page).to have_content("not@real.com is not a registered user")
  end
  scenario 'can delete a user from the app' do
    click_on('Remove User Authorization')
    expect(page).to_not have_content(@app_user.first_name)
  end
end
