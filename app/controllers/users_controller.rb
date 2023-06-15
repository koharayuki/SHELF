class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
    @article = Article.new
  end
end
