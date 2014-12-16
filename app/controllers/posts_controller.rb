class PostsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create]
  # same thing
  # before_action :authenticate_user!, only: [:index, :show]
  # authenticate_user is provided by Devise, again Devise is a library (gem) in Ruby


  def index #index.html
    #how do I get data from database and put it here??
    # this will store all the posts in an array 
    @posts = Post.all
    @post = Post.new
    # @comments = Comment.all
  end

  def create
    post = current_user.posts.new(post_params)
    if post.save
      redirect_to posts_path
    else
      flash[:message] = post.errors.messages
      redirect_to :back
    end
  end

  def show
    # params[:id] will look for the id in the URL
    # this basically retrieves the post with a specific id
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  private
    def post_params
      params.require(:post).permit(:title, :url)
    end
end
