class PostsController < ApplicationController
  def index
    # @posts = Post.all
    @posts = Post.page(params[:page]).per(2)
    # render :index, locals: { posts: posts }
  end

  def new
    render :new
  end

  def create
    new_post = Post.create(title: params["title"],
                           content: params["content"])
    redirect_to :root
  end

  def edit
    edit_post = Post.find(params[:id])
    render :edit
  end

  def update
    edit_post = Post.find(params[:id])
    edit_post.update(title: params["title"],
                              content: params["content"])
    redirect_to :root
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def destroy
    post = Post.find(params["id"])
    post.destroy
    redirect_to :root
  end

end
