require 'rails_helper'
require 'image_helper'
describe 'an api can', type: :api do
  before(:each) do
    ENV['kairos_gallery'] = 'test'
    @user = create(:user)
    @test_image = Test_image.new()
    # @user.enrollments.new(image: @test_image).enroll
    @app = create(:app)
    @user.apps << @app
    @app.authorized_users << @user
  end
  context 'authenticate a user via api' do
    # scenario 'GET /api/v1/authenticate with good image' do
    #   response = post '/api/v1/authenticate', {
    #     "app_id" => "#{@app.id}",
    #     "image" => @test_image.image
    #   }
    #   body = JSON.parse(response.body)
    #   expect(response.status).to eq(200)
    #   expect(body['authenticated']).to eq(true)
    #   expect(body['user']['name']).to eq(@user.first_name)
    # end
    #
    # scenario 'GET /api/v1/authenticate with no faces rejects' do
    #   response = post '/api/v1/authenticate', {
    #     "app_id" => "#{@app.id}",
    #     "image" => @test_image.bad_image
    #   }
    #   body = JSON.parse(response.body)
    #   expect(response.status).to eq(200)
    #   expect(body['authenticated']).to eq(false)
    #   expect(body['error']).to eq('Unable to find a face that matched an authorized user')
    # end

    # scenario 'GET /api/v1/authenticate rejects Donald Trump (or any stranger)' do
    #   response = post '/api/v1/authenticate', {
    #     "app_id" => "#{@app.id}",
    #     "image" => @test_image.the_donald
    #   }
    #   body = JSON.parse(response.body)
    #   expect(response.status).to eq(200)
    #   expect(body['authenticated']).to eq(false)
    #   expect(body['error']).to eq('Unable to find a face that matched an authorized user')
    # end

  end
end
