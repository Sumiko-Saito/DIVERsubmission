class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
    @blogs = Blog.all
  end
  def new
    @blog = Blog.new
  end
  def create
    @blog = Blog.new(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "You created a blog!"
      else
        render :new
      end
    end
  end
  def show
    @blog = Blog.find(params[:id])
  end
  def edit
    @blog = Blog.find(params[:id])
  end
  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "You edited the blog!"
    else
      render :edit
    end
  end
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice:"You deleted the blog!"
  end
  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end
  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
  def set_blog
    @blog = Blog.find(params[:id])
  end
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
