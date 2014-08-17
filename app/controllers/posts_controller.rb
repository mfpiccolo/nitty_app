class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    if @post = Post.create(post_params)
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
  end

  def index
    @posts = Post.all
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path
    else
      render :index
    end
  end


  private

  def post_params
    params.require(:post).permit(:name, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
