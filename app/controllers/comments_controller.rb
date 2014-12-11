class CommentsController < ApplicationController
  def index
    #how do I get data from database and put it here??

    # this will store all the posts in an array 
    @comments = Comment.all
    
  end
end
