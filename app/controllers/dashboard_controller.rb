class DashboardController < ApplicationController
  def index
    @apps = current_user.apps
  end
end
