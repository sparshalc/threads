class PostsController < ApplicationController 
    before_action :authenticate_user!
    before_action :find_post, only: [:edit,:update,:destroy]
    before_action :find_user,only: [:edit,:update,:destroy]
    def index
        @posts = Post.all.order("Created_at DESC")
        @post = Post.new

    end
    def new
    end
    def create
        @post = Post.create(post_params)
        if @post.save
            redirect_to root_path,notice: 'Post Published'
        else
            render :_form, status: :bad_request
        end
    end

    def show
        @post = Post.friendly.find(params[:id])
        @post.update(views: @post.views+1)
        @comment = @post.comments.all
    end

    def edit
    end
    def update
        if @post.update(post_params)
            redirect_to post_path(@post.id),notice: 'Post Updated!'
           else
               render :edit,status: :bad_request
           end
    end
    def destroy
        @post.destroy
        redirect_to posts_path, alert: 'Post was successfully deleted.'
      end
    private

    def post_params
        params.require(:post).permit(:title, :image, :user_id)
    end

    def find_post
        @post = Post.find(params[:id])
    end

    def find_user
        @post = current_user.posts.find_by(id: params[:id])
        redirect_to root_path, alert: 'Not Authorized!' if @post.nil?
    end

end