class Api::V1::UsersController < ApplicationController
  def index
    users = User.select(:email).where("email LIKE ?", "%#{params[:email]}%").limit(4).map { |e| e.email }
    render json: users
  end
end
