class EnrollmentsController < ApplicationController

  def new
    flash[:success] = ['You have to take a photo to complete the enrollment process']
  end

  def create
    binding.pry
    flash[:notice] = 'It looks like it worked'
    flash.keep(:notice)
    render js: "window.location = '#{root_path}'"
  end
end
