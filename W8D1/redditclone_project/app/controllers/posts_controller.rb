class PostsController < ApplicationController
    before_action :require_signed_in, only: [:create, :update, :edit, :destroy]
    before_action :is_author?, only: [:edit, :update, :destroy]
    def new
        render :new
    end

    def create
        @post = Post.new(post_params)
        @post.sub_id = params[:sub_id]
        if @post.save
            redirect_to post_url(@post)
        else
            flash[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def edit
        
    end

    def update

    end

    def destroy

    end

    def is_author?
        return false if current_user.nil?
        current_user.id == self.author_id
    end

    private

    def post_params
        params.require(:post).permit(:title, :url, :content)
    end
end
