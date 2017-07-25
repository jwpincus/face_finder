class DashboardController < ApplicationController
  before_action :authorize
  before_action :enrolled?
  def index
    @apps = current_user.apps
    @authentications = current_user.authentications
  end
end
