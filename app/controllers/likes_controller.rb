class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    like = Like.new(post_id: like_params[:post_id], user_id: current_user.id)
    if like.save
      notice = 'You liked this post!'
    else
      notice = like.errors
    end
    redirect_to posts_path(notice: notice, page: like_params[:page_id])
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    redirect_to posts_path(notice: 'Unliked this post', page: like_params[:page_id])
  end

  private

  def like_params
    params.permit(:post_id, :page_id)
  end
end