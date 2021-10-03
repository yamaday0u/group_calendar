class Admin::CalendarsController < ApplicationController
  before_action :check_admin?

  def index
    @calendars = Calendar.where(user_id: current_user)
  end

  private
  def check_admin?
    unless current_user.admin
      redirect_to root_path
    end
  end
end
