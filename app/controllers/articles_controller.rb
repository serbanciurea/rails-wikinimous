class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.save # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to article_path(@article)
  end

  def new
    @article = Article.new
end

def edit
  @article =Article.find(params[:id])
end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to article_path(@article)
  end


  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path , status: :see_other
  end



  def article_params
    params.require(:article).permit(:title, :content)
  end
end
