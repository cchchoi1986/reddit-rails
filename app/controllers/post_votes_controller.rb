class PostVotesController < ApplicationController
  # skip_before_filter :verify_authenticity_token
  def create
    # finds post given url with id
    # '/post_votes/:id'
    post = Post.find(params[:id])

    # binding.pry
    new_vote = PostVote.new(:user => current_user, :post => post)
    # same as new_votes = PostVote.new(:user_id => current_user.id, :post_id => post.id)
    if new_vote.save
      numVotes = post.post_votes.length
      # render json: status: 201
      # this is the response that ajax success will get
      render json: numVotes, status: 201
    end
  end
end
