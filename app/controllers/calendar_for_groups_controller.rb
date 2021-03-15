class CalendarForGroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @g_calendars = CalendarForGroup.where(group_id: params[:group_id])
    @group = Group.find(params[:group_id])
  end

  def new
    @g_calendar = CalendarForGroup.new
  end
end
