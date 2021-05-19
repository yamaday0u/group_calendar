class Api::V1::RoomsController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    mates = current_user.matchers
    render json: mates
  end
end
