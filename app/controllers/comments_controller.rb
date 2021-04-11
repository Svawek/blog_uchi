class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.new(comment_param)
    @comment.user = User.first
    if @comment.save
      redirect_to post_path(post), notice: 'Комментарий оставлен'
    else
      render :new
    end
  end

  private

  def comment_param
    params.require(:comment).permit(:text)
  end
end
