class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    date = Date.today

    @post[:date] = date
    binding.pry
    if @post.save
      flash[:notice] = "Post successfully added!"
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def edit

  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
