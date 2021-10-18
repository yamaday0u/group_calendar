class HomeController < ApplicationController
  before_action :check_logged_in, only: :index

  def index
    @news = News.all.order(created_at: :desc)
  end

  def new; end
end
