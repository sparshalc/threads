class LikesController < ApplicationController
    def create
      @post = Post.find_by(params[:id])
      @like = current_user.likes.new(like_params)
      if @like.save
        redirect_to @like.post,notice: 'Added to your liked post!'
      end
    end
  
    def destroy
      @post = Post.find_by(id: params[:id])
      @like = current_user.likes.find_by(params[:id])
       @like.destroy
        redirect_to post_path(@post.id),alert: 'Removed from liked post!'
    end
  
    private
    def like_params
      params.require(:like).permit(:post_id)
    end
  end
  