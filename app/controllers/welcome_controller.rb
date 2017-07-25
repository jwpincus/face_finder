class WelcomeController < ApplicationController
  before_action :enrolled?
  def index
    if current_user
      redirect_to dashboard_index_path
    end
  end
end
