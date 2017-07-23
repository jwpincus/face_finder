require 'spec_helper'
describe "A logged in user can manage apps" do
  scenario "from the dashboard user can create app" do
    user = create(:enrolled_user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit '/dashboard'
    expect(page).to have_current_path('/dashboard')
    click_on 'Create New App'
    fill_in('app_name', with: 'tester')
    find(:xpath, "//input[@id='min_confidence']").set 57
    click_on "Add new App"
    expect(page).to have_content('tester App created')
    expect(page).to have_content('57')
  end
end
