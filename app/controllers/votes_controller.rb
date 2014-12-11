class VotesController < ApplicationController
  def index
    @votes = Vote.all
    @vote = Vote.new
  end
  
  def new
    @vote = Vote.new
  end

  def create
    vote = Vote.new(vote_params)
    if vote.save
      redirect_to votes_path
    end
  end

  def show
    @vote = Vote.find(params[:id])
  end

  private
    def vote_params
      params.require(:vote).permit(:name, :foragainst)
    end
end
