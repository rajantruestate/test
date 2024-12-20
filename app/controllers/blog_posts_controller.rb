class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: [:show, :update, :destroy]

  def index
    @blog_posts = BlogPost.all
    render json: @blog_posts
  end

  def show
    render json: @blog_posts
  end

  def create
    @blog_posts = BlogPost.new(blog_posts_params)
    if @blog_posts.save
      render json: @blog_posts, status: :created, location: @blog_posts
    else
      render json: @blog_posts.errors, status: :unprocessable_entity
    end
  end

  def update
    if @blog_posts.update(blog_post_params)
      render json: @blog_posts
    else
      render json: @blog_posts.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @blog_posts.destroy
  end

  private

  def set_blog_post
    @blog_posts = BlogPost.find(params[:id])
  end

  def blog_post_params
    params.require(:blog_post).permit(:title, :content)
  end
end
