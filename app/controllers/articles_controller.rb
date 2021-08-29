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
    @article = Article.new(article_params)

    if @article.save
      flash[:success] = "Your article was sucessfuly created!"
      redirect_to @article
    else
      flash.now[:error] = "Your article couldn't be created!"
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      flash[:sucess] = "Your article was sucessfuly updated!"
      redirect_to @article
    else
      flash.now[:error] = "Your article couldn't be updated!"
      render :edit
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
