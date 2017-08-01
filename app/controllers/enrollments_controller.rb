class EnrollmentsController < ApplicationController
  protect_from_forgery except: [:create]
  before_action :authorize, except: [:create]

  def new
    flash[:success] = ['You have to take a photo to complete the enrollment process']
  end

  def create
    enrollment = current_user.enrollments.new(image: enroll_params[:image])
    if enrollment.enroll
      flash[:notice] = ['Succesfully enrolled image']
      flash.keep(:notice)
      render js: "window.location = '#{root_path}'"
    else
      flash[:danger] = ["It looks like we had some trouble picking out your beautiful face! Give it another shot if you don't mind"]
      flash.keep(:danger)
      render js: "window.location = '#{enroll_path}'"
    end
  end

  private

  def enroll_params
    params.permit(:image)
  end

end
