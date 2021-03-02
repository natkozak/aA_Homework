class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
    render :index
  end

  def show
    @blog = Blog.find_by(id: params[:id])
    render :show
  end

  def new
    @blog = Blog.new
    render :new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blog_url(@blog.id)
    else
      render :new
    end
  end

  def destroy
    @blog = Blog.find_by(id: params[:id])
    @blog.destroy
    redirect_to blogs_url
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :body, :author_id)
  end
end
