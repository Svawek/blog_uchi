class PostsController < ApplicationController
  before_action :set_user
  before_action :find_post, only: %i[show update edit destroy]
  def index
    @posts = Post.all
  end

  def show
    @comments = @post.comments
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = @user.posts.new(post_param)
    if @post.save
      redirect_to posts_path, notice: 'Пост успешно создан'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_param)
      redirect_to posts_path, notice: 'Пост успешно обновлен'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'Пост удален'
  end

  private

  def set_user
    @user = User.first
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def post_param
    params.require(:post).permit(:title, :text)
  end
end
