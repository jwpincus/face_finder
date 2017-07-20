class SessionsController < ApplicationController
  protect_from_forgery except: [:create_webcam]
  def new

  end

  def create
    user = User.find_by_email(params[:email].downcase)
    if user && user.authenticate(params[:password])
      login_actions(user)
    else
      flash[:danger] = ['Something went wrong! Please try again']
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def create_webcam
    user = User.find_by_email(params[:email].downcase)
    if user && user.visual_auth(params[:image], user.id)
      session[:user_id] = user.id
      flash[:success] = ['Succesfully authenticated through webcam']
      flash.keep(:notice)
      render js: "window.location = '#{root_path}'"
    else
      flash[:danger] = ["It looks like we didn't recognize you, Try again, or use a password"]
      render js: "window.location = '#{login_path}'"
    end
  end

  private

  def login_actions(user)
    session[:user_id] = user.id
    flash[:success] = ["Welcome Back #{current_user.first_name}"]
    if user.enrolled?
      redirect_to root_path
    else
      redirect_to '/enroll'
    end
  end

end
