class NewsController < ApplicationController
  before_action :check_admin?
  before_action :set_news, only: %i[show edit update destroy]

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

  def show; end

  def edit; end

  def update
    @news.update(news_params)
    if @news.valid?
      flash[:notice] = 'Updated news'
      redirect_to news_path(@news.id)
    else
      render 'edit'
    end
  end

  def destroy
    @news.destroy
    flash[:notice] = 'Deleted news'
    redirect_to news_index_path
  end

  private

  def news_params
    params.require(:news).permit(
      :title,
      :content
    )
  end

  def set_news
    @news = News.find(params[:id])
  end

  def check_admin?
    redirect_to root_path unless current_user.admin
  end
end
