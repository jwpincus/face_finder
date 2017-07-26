require 'rails_helper'
require 'image_helper'


describe 'A user can' do
  before(:each) do
    user = create(:enrolled_user)
    @app_user = create(:enrolled_user)
    @app = create(:app)
    user.apps << @app
    @app.authorized_users << @app_user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@app_user)

  end
  scenario 'see all of the apps they are authorized on' do
    visit '/dashboard'
    within('#authorized-apps') do
      
      expect(page).to have_content(@app.name)

    end
  end
  # authentications created live by external API are tested in api/v1/authentication_api_spec.rb


end
