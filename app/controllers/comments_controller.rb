class CommentsController < ApplicationController
  
  before_action :authenticate_user!
  # this is Denis's example for project1
  def getAll
    comment = Comment.all
    render json: comment
  end
  # this is Denis's example for project1
  def getFilteredComment
    commentFilted = Comment.find(comment_params)
    render json: commentFilted
  end

  def create
    # params([:comment][:content]) ---> dog
    # params([:comment][:post_id]) ---> 3
    # binding.pry
    comment = current_user.comments.new(
      :content => params[:content],
      :post_id => params[:post_id]
    )
    # comment = current_user.comments.new(comment_params)
    if comment.save
    #   # redirect_to comment.post
    #   # comment[:email] = current_user.email
      render json: {data: comment, email: current_user.email}, status: 201
    else
      redirect_to :back
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :post_id, :user_id)
    end
end
