class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end

  def enrolled?
    if current_user && !current_user.enrolled?
      redirect_to enroll_path
    end
  end

  def app_owner?(id)
    if !App.find(id).owners.include?(current_user)
      flash[:danger] = ['This resource is not available']
      redirect_to dashboard_index_path
    end
  end

end
