class WeetupsController < ApplicationController
  def index
    @weetups = Weetup.all
  end
end
