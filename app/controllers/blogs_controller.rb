class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  # before_action :accept_blog, only: [:new, :show, :edit, :update, :destroy]
  # before_action :accept_blog, except: [:index]
  #やっぱりログインしてからblog見れるようにしたいので、下記に。
  before_action :accept_blog

  def index
    @blogs = Blog.all
    @favorites = current_user.favorites.all
  end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    
    if @blog.save
      redirect_to @blog, notice: '作成しました' 
    else
      render :new 
    end
  end


  def update

      if @blog.update(blog_params)
        redirect_to @blog, notice: '更新しました'
      else
        render :edit
      end
  end


  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: '削除しました'
  end
  
  def confirm
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    render :new if @blog.invalid?
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :content)
    end
    
    def accept_blog
      redirect_to new_session_path if !logged_in?
    end
end
