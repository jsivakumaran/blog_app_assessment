class PostsController < ApplicationController
  def index
    @posts = Post.all
    render :index
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    date = Date.today

    @post[:date] = date
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  private
end
