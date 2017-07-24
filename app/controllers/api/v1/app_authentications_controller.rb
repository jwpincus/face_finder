class Api::V1::AppAuthenticationsController < ApplicationController
  protect_from_forgery except: [:create]
  def create
    response = Kairos.app_auth(params[:app_id], params[:image])
    render json: response
  end
end
