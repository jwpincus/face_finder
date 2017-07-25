class AuthorizedUsersController < ApplicationController
  before_action :user_owns_app
  def create
    app = App.find(params[:app_id])
    if User.exists?(email: params[:add_user_email])
      flash[:success] = ["#{params[:add_user_email]} was added to your app."]
      app.authorized_users << User.find_by(email: params[:add_user_email])
    else
      flash[:danger] = ["#{params[:add_user_email]} is not a registered user."]
    end
    redirect_to app_path(app)
  end

  def delete
    app = App.find(params[:app_id])
    app.authorized_users.delete(User.find(params[:user_id]))
    redirect_to app_path(app)
  end

  private

  def user_owns_app
    if !App.find(params[:app_id]).owners.include?(current_user)
      flash[:danger] = ['You are not authorized to manage this App']
      redirect_to dashboard_index_path
    end
  end

end
