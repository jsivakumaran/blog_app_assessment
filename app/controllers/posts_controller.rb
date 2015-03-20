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
    if @post.save
      flash[:notice] = @post.title + "successfully added!"
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:notice] = @post.title + "successfully deleted!"
      redirect_to posts_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice]="Post successfully Updated!"
      redirect_to posts_path
    else
      render :edit
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :date, :body)
    end
end
