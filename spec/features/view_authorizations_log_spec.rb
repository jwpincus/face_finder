require 'rails_helper'
require 'image_helper'


describe 'A user can' do
  before(:each) do
    user = create(:enrolled_user)
    @app_user = create(:enrolled_user)
    @app = create(:app)
    user.apps << @app
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@app_user)
    @authentication = @app_user.authentications.create(app: @app, image: Test_image.new().image)
  end
  scenario 'see all of their authentications' do
    visit '/dashboard'
    within('#authentications-table') do
      expect(page).to have_content(@app.name)
      expect(page).to have_content(@authentication.created_at)
    end
  end
  # authentications created live by external API are tested in api/v1/authentication_api_spec.rb


end
