class FollowsController < ApplicationController

  def create
    follow = current_user.active_follows.new(follower_id: params[:user_id])
    follow.save
    redirect_back fallback_location: root_path
  end

  def destroy
    follow = current_user.active_follows.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_back fallback_location: root_path
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
    follow = current_user.active_follows.find_by(follower_id: params[:user_id])

  end
end
