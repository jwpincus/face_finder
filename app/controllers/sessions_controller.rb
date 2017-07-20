class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = ["Welcome Back #{current_user.first_name}"]
      if user.enrolled?
        redirect_to root_path
      else
        redirect_to '/enroll'
      end
    else
      flash[:danger] = ['Something went wrong! Please try again']
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
