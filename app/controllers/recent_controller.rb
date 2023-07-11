class RecentController < ApplicationController
  def post
    @user = current_user.following.find_by(params[:id])
    @posts = @user.posts.all  
  end
  def posts
    @posts = Post.all.order("Created_at DESC")  
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end
end
