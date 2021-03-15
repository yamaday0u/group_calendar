class CalendarForGroupsController < ApplicationController
  def index
    @g_calendars = CalendarForGroup.where(group_id: params[:group_id])
    @group = Group.find(params[:group_id])
  end
end
