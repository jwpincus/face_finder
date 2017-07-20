class EnrollmentsController < ApplicationController
  protect_from_forgery except: [:create]
  before_action :authorize, except: [:create]

  def new
    flash[:success] = ['You have to take a photo to complete the enrollment process']
  end

  def create
    enrollment = current_user.enrollments.new(image: enroll_params[:image])
    enrollment.send_to_kairos
    if enrollment.save
      flash[:notice] = ['It looks like it worked']
      flash.keep(:notice)
      render js: "window.location = '#{root_path}'"
    end
  end

  private

  def enroll_params
    params.permit(:image)
  end
end
