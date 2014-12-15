class PostVotesController < ApplicationController
  def create
    # finds post given url with id
    # '/post_votes/:id'
    post = Post.find(params[:id])
    new_vote = PostVote.new(:user => current_user, :post => post)
    # same as new_votes = PostVote.new(:user_id => current_user.id, :post_id => post.id)
    if new_vote.save
      render json: new_vote, status: 201
    end
  end
end
