class DashboardController < ApplicationController
  before_action :authorize
  before_action :enrolled?

  def index
    @apps = current_user.apps.sort_by { |app| app.name.downcase }
    @authentications = current_user.authentications.paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end
  
end
