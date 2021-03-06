class CalendarsController < ApplicationController
  def index
  end

  def new
    @calendar = Calendar.new
  end

end
