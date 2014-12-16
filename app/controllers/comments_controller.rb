class CommentsController < ApplicationController
  
  def create
    # params([:comment][:content]) ---> dog
    # params([:comment][:post_id]) ---> 3
    # binding.pry
    comment = current_user.comments.new(comment_params)
    if comment.save
      redirect_to comment.post
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
      params.require(:comment).permit(:content, :post_id)
    end
end
