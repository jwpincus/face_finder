class AppsController < ApplicationController
  def new
    @app = App.new
  end

  def create
    app = App.new(app_params)
    if app.save
      current_user.apps << app
      flash[:success] = ["#{app.name} App created"]
      redirect_to dashboard_index_path
    else
      flash[:danger] = ["Something went wrong, please try again"]
      redirect_to new_app_path
    end
  end

  def show
    @app = App.find(params[:id])
    @users = @app.authorized_users
    if !@app.owners.include?(current_user)
      flash[:danger] = ['You are not authorized to manage this App']
      redirect_to dashboard_index_path
    end
  end

  private

  def app_params
    params.require(:app).permit(:name, :min_confidence)
  end
end
