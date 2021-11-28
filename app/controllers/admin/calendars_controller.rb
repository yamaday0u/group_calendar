class Admin::CalendarsController < ApplicationController
  before_action :check_admin?

  def index
    @calendars = Calendar.where(user_id: current_user)
  end

  private

  def check_admin?
    redirect_to root_path unless current_user.admin
  end
end
