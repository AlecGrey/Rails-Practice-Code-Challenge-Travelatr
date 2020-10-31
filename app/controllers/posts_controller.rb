class PostsController < ApplicationController

    before_action :find_post, only: [:show, :edit, :update]

    def show
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(sanitized_params)
        if @post.save
            redirect_to post_path(@post)
        else
            render new_post_path
        end
    end

    def edit
        render new_post_path
    end

    def update
        # byebug
        if params[:like]
            @post.add_like
            @post.save
            redirect_to post_path(@post)
        elsif @post.update(sanitized_params)
            redirect_to post_path(@post)
        else
            render new_post_path
        end
    end

    private

    def find_post
        @post = Post.find(params[:id])
    end

    def sanitized_params
        params.require(:post).permit(:like, :blogger_id, :destination_id, :title, :content)
    end

end