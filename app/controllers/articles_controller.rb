class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(title: "...", body: "...")

    if @article.save
      flash[:success] = "Your article as sucessfuly created!"
      redirect_to @article
    else
      flash.now[:error] = "Your article couldn't be created!"
      render :new
    end
  end
end
