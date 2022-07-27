class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]
  def index
    @article= Article.all
    render "articles/index"
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article= Article.new
  end

  def create
    @article= Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article= Article.find(params[:id])
  end

  def update
    @articles = Article.find(params[:id])

    if @articles.update(article_params)
      redirect_to @articles
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article= Article.find(params[:id])
    @article.destroy
    redirect_to root_path , status: :see_other
  end

  private
  def article_params
    params.require(:article).permit(:title,:body,:status)
  end

end
