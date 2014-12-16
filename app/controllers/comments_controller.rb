class CommentsController < ApplicationController
  
  before_action :authenticate_user!
  # this is Denis's example for project1
  def getAll
    comment = Comment.all
    render json: comment
  end
  # this is Denis's example for project1
  def getFilteredComment
    commentFilted = Comment.where(comment_params)
    render json: commentFilted
  end

  def create
    # params([:comment][:content]) ---> dog
    # params([:comment][:post_id]) ---> 3
    # binding.pry
    
    comment = current_user.comments.new(comment_params)
    if comment.save
      # redirect_to comment.post
      # comment[:email] = current_user.email
      render json: comment, status: 201
    else
      redirect_to :back
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @post = Post.all
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :post_id, :user_id)
    end
end
