class RecentController < ApplicationController
  def post
  end
  def posts
    @posts = Post.all.order("Created_at DESC")  
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end
end
