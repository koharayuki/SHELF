class FavoritesController < ApplicationController

  def create
    article = Article.find(params[:article_id])
    current_user.favorite(article)
    redirect_back fallback_location: root_path, success: t('defaults.message.bookmark')
  end

  def destroy
    article = current_user.favorites.find(params[:id]).article
    current_user.unfavorite(article)
    redirect_back fallback_location: root_path, success: t('defaults.message.unbookmark')
  end

end
