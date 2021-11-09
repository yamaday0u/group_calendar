class NewsController < ApplicationController
  before_action :check_admin?

  def index
    @news = News.all.order(created_at: :desc)
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)
    if @news.valid?
      @news.save
      redirect_to news_index_path, notice: 'Added news'
    else
      render 'new'
    end
  end

  def show
    @news = News.find_by(id: params[:id])
  end

  def edit
    @news = News.find_by(id: params[:id])
  end

  private
  def news_params
    params.require(:news).permit(
      :title,
      :content
    )
  end

  def check_admin?
    unless current_user.admin
      redirect_to root_path
    end
  end
end
