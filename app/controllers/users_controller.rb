class UsersController < ApplicationController

  def index
  end


  def show
    @user = User.find(params[:id])
    @articles = @user.articles
    @article = Article.find(params[:id])

  def favorites
    @favorites_articles = current_user.favorits_articles.includes(:user).order(created_at: :desc)
  end
end

end
