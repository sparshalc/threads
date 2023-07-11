class CommentsController < ApplicationController 
    def create
        @post = Post.find_by(id: params[:post_id])
        @comment = @post.comments.create(comments_params)
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to post_path(@post.id),notice: ' Comment Added'
        else
            redirect_to post_path(@post.id),alert: "Comment can't be blank!"
        end
    end

    def destroy
        @post = Post.find_by(id: params[:post_id])
        @comment = @post.comments.find_by(id: params[:id])
        if @comment.destroy
            redirect_to post_path(@post.id),alert: 'Comment Deleted!'
        end
    end

    private
    def comments_params
        params.require(:comment).permit(:title)
    end
end