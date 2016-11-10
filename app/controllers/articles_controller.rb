class ArticlesController < ApplicationController
  def index 
    @articles = Article.all 
  end 

  def show 
    @article = Article.find(params[:id])
  end 

  def new
  end

  def create 
    # Note that we use `@` when to create variables that are "instance" variables. 
    # Instead of being local to the scope, instance variables are available to all 
    # methods within a class. Using an instance variable in the controller (i.e., here)
    # makes them available in the view.
    @article = Article.new(articles_params)

    @article.save                 # returns boolean indicating whether article was saved
    redirect_to @article
  end

  private 
  def articles_params
    params.require(:article).permit(:title, :text)
  end 
end
