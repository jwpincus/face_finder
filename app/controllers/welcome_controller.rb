class WelcomeController < ApplicationController
  before_action :enrolled?
  def index
  end
end
