class EnrollmentsController < ApplicationController

  def new
    flash[:success] = ['You have to take a photo to complete the enrollment process']
  end
end
