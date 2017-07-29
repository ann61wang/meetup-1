class WeetupsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
  before_action :find_weetup_and_check_permission, only: [:edit, :update, :destroy]
  def index
    @weetups = Weetup.all
  end

  def show
    @weetup = Weetup.find(params[:id])
    @comments = @weetup.comments
  end

  def new
    @weetup = Weetup.new
  end

  def create
    @weetup = Weetup.new(weetup_params)
    @weetup.user = current_user

    if @weetup.save
      redirect_to weetups_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @weetup.update(weetup_params)
      redirect_to weetups_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @weetup.destroy
    redirect_to weetups_path, alert: "Meetup deleted"
  end

  private

  def find_weetup_and_check_permission
    @weetup = Weetup.find(params[:id])

    if current_user != @weetup.user
      redirect_to root_path, alert: "You have no permission"
    end
  end

  def weetup_params
    params.require(:weetup).permit(:title, :description)
  end
end
