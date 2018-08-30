class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]

  def index
    if params[:category].blank?
      @posts = Post.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @posts = Post.where(:category_id => @category_id).order("created_at DESC")
    end
  end

  def show
  end

  def new
    @post = current_user.posts.build
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.category_id = params[:category_id]
    if @post.save
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else
      flash[:alert] = "Your new post couldn't be created!  Please check the form."
      render :new
    end
  end



  def edit
  end

  def update
  end

  def destory
  end

    private

    def post_params
      params.require(:post).permit(:title, :content, :category_id)
    end

    def find_post
      @post = Post.find(params[:id])
    end

end
