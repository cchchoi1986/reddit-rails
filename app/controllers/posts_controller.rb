class PostsController < ApplicationController
  def index #index.html
    #how do I get data from database and put it here??
    # this will store all the posts in an array 
    @posts = Post.all
    # @comments = Comment.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to posts_path
    end
  end

  def show
    # params[:id] will look for the id in the URL
    # this basically retrueves the post with a specific id
    post = Post.find(params[:id])
  end

  private
    def post_params
      params.require(:post).permit(:title, :url)
    end


end
