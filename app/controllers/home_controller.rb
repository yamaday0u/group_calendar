class HomeController < ApplicationController
  before_action :check_logged_in, only: :index

  def index; end

  def new; end
end
