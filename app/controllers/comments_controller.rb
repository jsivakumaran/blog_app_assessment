class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new

  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment Successfully added!"
      redirect_to post_path(@comment.post)
    else
      render :new
    end
  end

  def edit
    binding.pry

    @post = Post.find(params[:post_id])

    @comment = @post.comments.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "Comment successfully Updated!"
      redirect_to post_comment_path
    else
      render :edit
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
