class NewsController < ApplicationController

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

  private
  def news_params
    params.require(:news).permit(
      :title,
      :content
    )    
  end
end
