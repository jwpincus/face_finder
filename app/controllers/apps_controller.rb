class AppsController < ApplicationController
  before_action(only: [:destroy, :update, :show])  { app_owner?(params[:id]) }

  def new
    @app = App.new
  end

  def create
    app = App.new(app_params)
    if app.save
      current_user.apps << app
      app.authorized_users << current_user
      flash[:success] = ["#{app.name} App created"]
      redirect_to dashboard_index_path
    else
      flash[:danger] = ["Something went wrong, please try again"]
      redirect_to new_app_path
    end
  end

  def update
    app = App.find(params[:id])
    if app.update_attributes(app_params)
      flash[:success] = ['App information updated']
      redirect_to app_path(app)
    end
  end

  def show
    @app = App.find(params[:id])
    @users = @app.authorized_users

  end

  def destroy
    App.find(params[:id]).destroy
    flash[:success] = ['App successfully deleted']
    redirect_to dashboard_index_path
  end
  
  private

  def app_params
    params.require(:app).permit(:name, :min_confidence)
  end

end
