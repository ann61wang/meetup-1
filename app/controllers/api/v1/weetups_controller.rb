class Api::V1::WeetupsController < Api::V1::BaseController
   before_action :authenticate_user!, only: [:index]

  def index
    @weetups = Weetup.all
  end
end
