class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_id, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: :edit

  def index
    @users = User.all
    @articles = Article.order("created_at DESC")
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to article_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy if current_user.id == @article.user_id
    redirect_to root_path
  end

  private

  def article_params
    params.require(:article).permit(:title,:text,:genre_id,:URL).merge(user_id: current_user.id)
  end

  def set_id
    @article = Article.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
