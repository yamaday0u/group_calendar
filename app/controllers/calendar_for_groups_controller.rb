class CalendarForGroupsController < ApplicationController
  def index
    @g_calendars = CalendarForGroup.where(group_id: params[:id])
  end
end
