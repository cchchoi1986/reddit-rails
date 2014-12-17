class CommentsController < ApplicationController
  
  def create
    # params([:comment][:content]) ---> dog
    # params([:comment][:post_id]) ---> 3
    # binding.pry
    @myComment = current_user.comments.new(comment_params)
    if @myComment.save
      # tells computer that it needs to render pages in the following format
      respond_to do |format|
        #order matters here. its going to show javascript (json) response first

        #in Rails, the convention is we need to create a 'create.js.erb' file inside comments view folder
        format.js
        format.html { redirect_to myComments.post}
    end
    else
      redirect_to :back
    end
  end

  def show
    @comment = Comment.find(params[:id])
    # @post = Post.all
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end
end
