class WeetupsController < ApplicationController
  def index
    @weetups = Weetup.all
  end

  def show
    @weetup = Weetup.find(params[:id])
  end

  def new
    @weetup = Weetup.new
  end

  def create
    @weetup = Weetup.new(weetup_params)
    if @weetup.save
      redirect_to weetups_path
    else
      render :new
    end
  end

  def edit
    @weetup = Weetup.find(params[:id])
  end

  def update
    @weetup = Weetup.find(params[:id])
    if @weetup.update(weetup_params)
      redirect_to weetups_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @weetup = Weetup.find(params[:id])
    @weetup.destroy
    flash[:alert] = "Meetup deleted"
    redirect_to weetups_path
  end

  private

  def weetup_params
    params.require(:weetup).permit(:title, :description)
  end
end
